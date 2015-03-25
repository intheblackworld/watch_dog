class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  respond_to :html

  #def _header
  #  @companys = Company.find
  #  (1)
 # end

  def show
    respond_with(@company)
  end

  def new
    @company = Company.new
    respond_with(@company)
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    @company.save
    respond_with(@company)
  end

  def update
    @company.update(company_params)
    respond_with(@company)
  end

  def destroy
    @company.destroy
    respond_with(@company)
  end

  private
   # def set_company
   #   @company = Company.find(1)
   # end

    def company_params
      params.require(:company).permit(:name)
    end
end
