class AwardedsController < ApplicationController
  before_action :set_awarded, only: %i[show edit update destroy]

  # GET /awardeds or /awardeds.json
  def index
    @awardeds = Awarded.all
    @projects = Project.all
    @types = Type.all
    @awards = Award.all
    @display_lines = DisplayLine.all
    @contributions = Contribution.all
  end

  # GET /awardeds/1 or /awardeds/1.json
  def show; end

  # GET /awardeds/new
  def new
    @awarded = Awarded.new
  end

  # GET /awardeds/1/edit
  def edit; end

  # POST /awardeds or /awardeds.json
  def create
    @awarded = Awarded.new(awarded_params)

    respond_to do |format|
      if @awarded.save
        format.html { redirect_to(awarded_url(@awarded), notice: 'Awarded was successfully created.') }
        format.json { render(:show, status: :created, location: @awarded) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @awarded.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /awardeds/1 or /awardeds/1.json
  def update
    respond_to do |format|
      if @awarded.update(awarded_params)
        format.html { redirect_to(awarded_url(@awarded), notice: 'Awarded was successfully updated.') }
        format.json { render(:show, status: :ok, location: @awarded) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @awarded.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /awardeds/1 or /awardeds/1.json
  def destroy
    @awarded.destroy

    respond_to do |format|
      format.html { redirect_to(awardeds_url, notice: 'Awarded was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_awarded
    @awarded = Awarded.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def awarded_params
    params.require(:awarded).permit(:AwardedDate, :AwardID, :ProjectID)
  end
end
