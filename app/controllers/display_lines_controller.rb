class DisplayLinesController < ApplicationController
  before_action :set_display_line, only: %i[ show edit update destroy ]

  # GET /display_lines or /display_lines.json
  def index
    @display_lines = DisplayLine.all
  end

  # GET /display_lines/1 or /display_lines/1.json
  def show
  end

  # GET /display_lines/new
  def new
    @display_line = DisplayLine.new
  end

  # GET /display_lines/1/edit
  def edit
  end

  # POST /display_lines or /display_lines.json
  def create
    @display_line = DisplayLine.new(display_line_params)

    respond_to do |format|
      if @display_line.save
        format.html { redirect_to display_line_url(@display_line), notice: "Display line was successfully created." }
        format.json { render :show, status: :created, location: @display_line }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @display_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /display_lines/1 or /display_lines/1.json
  def update
    respond_to do |format|
      if @display_line.update(display_line_params)
        format.html { redirect_to display_line_url(@display_line), notice: "Display line was successfully updated." }
        format.json { render :show, status: :ok, location: @display_line }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @display_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /display_lines/1 or /display_lines/1.json
  def destroy
    @display_line.destroy

    respond_to do |format|
      format.html { redirect_to display_lines_url, notice: "Display line was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_display_line
      @display_line = DisplayLine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def display_line_params
      params.require(:display_line).permit(:ComponentContributed, :ComponentStartDate, :ComponentEndDate, :ContribProjectID, :ContribType)
    end
end
