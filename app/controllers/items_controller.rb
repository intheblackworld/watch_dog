class ItemsController < ApplicationController
  before_action :company_set
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :list_all]
  # GET /items
  # GET /items.json
  def index
   @classification = Classification.find(params[:classification_id]) 
   @items = @classification.items.page(params[:page]).per(5)
   @company = Company.find(1)
  end

  def list_all

    @classifications = Classification.all
    @items = Item.page(params[:page]).per(9)
    @company = Company.find(1)
  end

  # GET /items/1
  # GET /items/1.json
  def show

  end

  # GET /items/new
  def new
    @classification = Classification.find(params[:classification_id])
    @item = @classification.items.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @classification = Classification.find(params[:classification_id])
    @item = @classification.items.create(params[:item].permit(:title, :model_number, :standard, :image))

    respond_to do |format|
      if @item.save
        format.html { redirect_to admin_path, notice: '商品已新增' }

      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to admin_path, notice: '商品已新增' }  

      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to admin_path, notice: '商品已刪除' }  

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def company_set
      @company = Company.find(1)
    end
    def set_item
      @classification = Classification.find(params[:classification_id])
      @item = @classification.items.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:model_number, :title, :standard, :image)
    end
end
