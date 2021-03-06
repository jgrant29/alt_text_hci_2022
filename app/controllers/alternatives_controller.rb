class AlternativesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_alternative, only: %i[ show edit update destroy ]

  # GET /alternatives or /alternatives.json
  def index
    @alternatives = Alternative.all
  end

  # GET /alternatives/1 or /alternatives/1.json
  def show
    @alt = Alternative.find(params[:id])
  end

  # GET /alternatives/new
  def new
    @alternative = Alternative.new
  end

  # GET /alternatives/1/edit
  def edit
  end

  # POST /alternatives or /alternatives.json
  def create
    @alternative = current_user.alternatives.new(alternative_params)

    respond_to do |format|
      if @alternative.save
        format.html { redirect_to alternative_url(@alternative), notice: "Alternative was successfully created." }
        format.json { render :show, status: :created, location: @alternative }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @alternative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alternatives/1 or /alternatives/1.json
  def update
    respond_to do |format|
      if @alternative.update(alternative_params)
        format.html { redirect_to alternative_url(@alternative), notice: "Alternative was successfully updated." }
        format.json { render :show, status: :ok, location: @alternative }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @alternative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alternatives/1 or /alternatives/1.json
  def destroy
    @alternative.destroy

    respond_to do |format|
      format.html { redirect_to alternatives_url, notice: "Alternative was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alternative
      @alternative = current_user.alternatives.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def alternative_params
      params.require(:alternative).permit(:title, :orginal_url, :original_source, :verified, :image, :tag_list)
    end
end
