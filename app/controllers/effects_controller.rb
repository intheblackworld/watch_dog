class EffectsController < ApplicationController
  before_action :company_set
  before_action :set_effect, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /effects
  # GET /effects.json
  def index
    @company = Company.find(1)
    @effects = Effect.page(params[:page]).per(6)
     respond_to do |format|
      format.html
      format.js 

  end
  end

  # GET /effects/1
  # GET /effects/1.json
  def show
  end

  # GET /effects/new
  def new
    @effect = Effect.new
  end

  # GET /effects/1/edit
  def edit
  end

  # POST /effects
  # POST /effects.json
  def create
    @effect = Effect.new(effect_params)

    respond_to do |format|
      if @effect.save
        format.html { redirect_to admin_path, notice: '實機效果已新增' }


      else
        format.html { render :new }
        format.json { render json: @effect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /effects/1
  # PATCH/PUT /effects/1.json
  def update
    respond_to do |format|
      if @effect.update(effect_params)
        format.html { redirect_to admin_path, notice: '安裝案例已新增' }

      else
        format.html { render :edit }
        format.json { render json: @effect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /effects/1
  # DELETE /effects/1.json
  def destroy
    @effect.destroy
    respond_to do |format|
      format.html { redirect_to admin_path, notice: '安裝案例已新增' }  

    end
  end

  private
   def company_set
      @company = Company.find(1)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_effect
      @effect = Effect.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def effect_params
      params.require(:effect).permit(:title, :image)
    end
end
