class SpecialsController < ApplicationController
  before_action :company_set
  before_action :set_special, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /specials
  # GET /specials.json
  def index
    @specials = Special.page(params[:page]).per(4)
    @company = Company.find(1)
  end

  # GET /specials/1
  # GET /specials/1.json
  def show
    @special = Special.find(params[:id])
  end

  # GET /specials/new
  def new
    @special = Special.new
  end

  # GET /specials/1/edit
  def edit
    @special = Special.find(params[:id])
  end

  # POST /specials
  # POST /specials.json
  def create
    @special = Special.new(special_params)

    respond_to do |format|
      if @special.save
        format.html { redirect_to @special, notice: '特惠方案已新增.' }
        format.json { render :show, status: :created, location: @special }
        redirect_to admin_path
      else
        format.html { render :new }
        format.json { render json: @special.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specials/1
  # PATCH/PUT /specials/1.json
  def update
    respond_to do |format|
      if @special.update(special_params)
        format.html { redirect_to @special, notice: '特惠方案已更新.' }
        format.json { render :show, status: :ok, location: @special }
      else
        format.html { render :edit }
        format.json { render json: @special.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specials/1
  # DELETE /specials/1.json
  def destroy
    @special.destroy
    respond_to do |format|
      format.html { redirect_to specials_url, notice: '特惠方案已刪除.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
     def company_set
      @company = Company.find(1)
    end
    def set_special
      @special = Special.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def special_params
      params.require(:special).permit(:title, :description, :price, :image)
    end
end
