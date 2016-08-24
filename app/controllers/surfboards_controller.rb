class SurfboardsController < ApplicationController
  before_action :set_surfboard, only: [:show, :edit, :update, :destroy]

  # GET /surfboards
  # GET /surfboards.json
  def index
    @surfboards = Surfboard.all
  end

  # GET /surfboards/1
  # GET /surfboards/1.json
  def show
  end

  # GET /surfboards/new
  def new
    @surfboard = Surfboard.new
  end

  # GET /surfboards/1/edit
  def edit
  end

  # POST /surfboards
  # POST /surfboards.json
  def create
    @surfboard = Surfboard.new(surfboard_params)

    respond_to do |format|
      if @surfboard.save
        format.html { redirect_to @surfboard, notice: 'Surfboard was successfully created.' }
        format.json { render :show, status: :created, location: @surfboard }
      else
        format.html { render :new }
        format.json { render json: @surfboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surfboards/1
  # PATCH/PUT /surfboards/1.json
  def update
    respond_to do |format|
      if @surfboard.update(surfboard_params)
        format.html { redirect_to @surfboard, notice: 'Surfboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @surfboard }
      else
        format.html { render :edit }
        format.json { render json: @surfboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surfboards/1
  # DELETE /surfboards/1.json
  def destroy
    @surfboard.destroy
    respond_to do |format|
      format.html { redirect_to surfboards_url, notice: 'Surfboard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_surfboard
      @surfboard = Surfboard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def surfboard_params
      params.require(:surfboard).permit(:size, :color, :length_in_cm)
    end
end
