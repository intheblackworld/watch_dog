Rails.application.routes.draw do

#後台可以操控的   
  resources :effects    #實機效果
  resources :installs   #安裝實績
  resources :specials   #特惠方案  
  resources :classifications do
   resources :items
  end                   #所有商品  
   

   root 'home#index'
   #導覽列___________________________________
   get '/after_survise' => 'home#after_survise' # 售後服務
   get '/offer' => 'home#offer' #服務項目  
   get '/about_monitor' => 'home#about_monitor'# 關於監視器
   # special_path  特惠方案路由
   # install_path  安裝實績路由
   # effect_path   實機效果路由



   #列出所有商品_______________________________

   resources :classifications do
    collection do
         get 'items'
      end
    end    


   
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
