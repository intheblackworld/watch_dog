class InstallsController < ApplicationController
  before_action :company_set
  before_action :set_install, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /installs
  # GET /installs.json
  def index
    @installs = Install.page(params[:page]).per(3)
    @company = Company.find(1)
  end

  # GET /installs/1
  # GET /installs/1.json
  def show
  end

  # GET /installs/new
  def new
    @install = Install.new
  end

  # GET /installs/1/edit
  def edit
  end

  # POST /installs
  # POST /installs.json
  def create
    @install = Install.new(install_params)

    respond_to do |format|
      if @install.save
        format.html { redirect_to admin_path, notice: '安裝案例已新增' }


      else
        format.html { render :new }
        format.json { render json: @install.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /installs/1
  # PATCH/PUT /installs/1.json
  def update
    respond_to do |format|
      if @install.update(install_params)
        format.html { redirect_to admin_path, notice: '安裝案例已新增' }

      else
        format.html { render :edit }
        format.json { render json: @install.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /installs/1
  # DELETE /installs/1.json
  def destroy
    @install.destroy
    respond_to do |format|
        format.html { redirect_to admin_path, notice: '安裝案例已新增' }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
     def company_set
      @company = Company.find(1)
    end
    def set_install
      @install = Install.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def install_params
      params.require(:install).permit(:description, :area, :image)
    end
end
