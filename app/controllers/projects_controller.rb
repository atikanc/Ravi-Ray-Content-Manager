class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  skip_before_action :authenticate_admin!, only: [:public, :user_help]

  # GET /projects or /projects.json
  def index
    if params[:search]
      @projects = Project.search(params[:search])
    elsif params[:searchContributions]
      @projects = Project.searchContributions(params[:searchContributions])
    else
      @projects = Project.all
    end

    @types = Type.all
    @contributions = Contribution.all.pluck(:ContributionType)
    
  end

  def public
    if params[:search]
      @projects = Project.search(params[:search])
    elsif params[:searchContributions]
      @projects = Project.searchContributions(params[:searchContributions])
    else
      @projects = Project.all
    end

    @types = Type.all
    @contributions = Contribution.all.pluck(:ContributionType)
    @awardeds = Awarded.all
    @awards = Award.all
    @contrib = DisplayLine.where(Project: @project)

  end

  def user_help
  end

  def admin_help
  end

  # GET /projects/1 or /projects/1.json
  def show
    @contrib = DisplayLine.where(Project: @project)
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit; end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to(project_url(@project), notice: 'Project was successfully created.') }
        format.json { render(:show, status: :created, location: @project) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @project.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to(project_url(@project), notice: 'Project was successfully updated.') }
        format.json { render(:show, status: :ok, location: @project) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @project.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    DisplayLine.where(Project: @project.id).find_each do |dl|
      dl.destroy
    end

    Awarded.where(ProjectID: @project.id).find_each do |ad|
      ad.destroy
    end

    respond_to do |format|
      format.html { redirect_to(projects_url, notice: 'Project was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:ProjectName, :ProjectLink, :ProjectOwner, :ProjectStart, :ProjectEnd, :ProjectDescription, :ProjectCover,
                                    :ContributionID, :DisplayLineID, :AwardedID, :AwardID, :TypeID
    )
  end
end
