class AdminsController < ApplicationController
before_action :company_set
before_action :authenticate_user!  
protect_from_forgery
skip_before_action :verify_authenticity_token, if: :js_request?


  def manage
    
     
  end

  def effect_list
    @effects = Effect.all.order("created_at DESC")
    respond_to do |format|
      format.html
      format.js
    end
  end

  def install_list
    @installs = Install.all.order("created_at DESC")
    respond_to do |format|
      format.html
      format.js
    end
  end

  def special_list
     @specials = Special.all.order("created_at DESC")
    respond_to do |format|
      format.html
      format.js
    end
  end

  def item_list
    @classifications = Classification.all

    @items = Item.order('created_at DESC').all
    respond_to do |format|
      format.html
      format.js
    end
  end
  

protected
  
   def company_set
      @company = Company.find(1)
    end

  def js_request?
    request.format.js?
  end

end
