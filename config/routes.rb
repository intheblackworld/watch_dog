Rails.application.routes.draw do

  resources :companies

  devise_for :users
#後台可以操控的   
  resources :effects    #實機效果
  resources :installs   #安裝實績
  resources :specials   #特惠方案  
  resources :classifications do
   resources :items
  end                   #所有商品 

 get '/items/list_all' , to: 'items#list_all'
 get '/admin', to: "admins#manage"
 get '/admin/effect_list', to: "admins#effect_list"
 get '/admin/install_list', to: "admins#install_list"
 get '/admin/special_list', to: "admins#special_list"
 get '/admin/item_list', to: "admins#item_list"  

   root 'home#index'
   #導覽列___________________________________
   get '/after_survise' => 'home#after_survise' # 售後服務
   get '/offer' => 'home#offer' #服務項目  
   get '/about_monitor' => 'home#about_monitor'# 關於監視器
   get '/contact_us' => 'home#contact_us' #聯絡我們
   # special_path  特惠方案路由
   # install_path  安裝實績路由
   # effect_path   實機效果路由



   #列出所有商品_______________________________

   #resources :classifications do
    #collection do
     #    get 'item_all'
      #end
    #end


   
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):

  # Example resource route with options:
  

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
