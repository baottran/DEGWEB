Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  resources :posts do 
    resources :comments
  end

  root 'inquiries#index'

  resources :inquiries do
    resources :comments
  end

  resources :searches

  get 'inquiries/:id/attach' => 'inquiries#attach'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  get 'reporting' => 'inquiries#reporting'

  get 'test' => 'inquiries#thankyoutest'

  # static pages 
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'
  get 'links' => 'welcome#links'
  get 'sponsorship' => 'welcome#sponsorship'
  get "/sponsorship/sponsors" => 'welcome#sponsors'
  get "/sponsorship/inquiry" => 'welcome#sponsorship_inquiry'
  get "/sponsorship/advertising" => 'welcome#sponsorship_advertising'
  get "toolbox" => "toolbox#index"
  get "toolbox/tips" => "toolbox#tips"
  get 'toolbox/knowledgebase' => 'toolbox#knowledgebase'
  get 'toolbox/audatex' => 'toolbox/audatex'
  get 'toolbox/ccc' => 'toolbox/ccc'
  get 'toolbox/mitchell' => 'toolbox/mitchell'

  # reporting json paths
  get 'reporting/submitted_inquiries' => 'inquiries#submitted_inquiries'
  get 'reporting/submitted_inquiries_datasets' => 'inquiries#submitted_inquiries_datasets'
  get 'reporting/response_time' => 'inquiries#response_time'
  get 'reporting/inquiry_counts' => 'inquiries#inquiry_counts'
  get 'reporting/unresolved_list' => 'inquiries#unresolved_list'
  get 'reporting/unsubmitted_list' => 'inquiries#unsubmitted_list'
  get 'reporting/avg_submit_list' => 'inquiries#avg_submit_list'
  get 'reporting/avg_resolve_list' => 'inquiries#avg_resolve_list'

  patch 'inquiries/:id/resolve' => 'inquiries#resolve'
  patch 'inquiries/:id/customer' => 'inquiries#edit_customer'
  patch 'inquiries/:id/vehicle' => 'inquiries#edit_vehicle'
  patch 'inquiries/:id/edit_inquiry' => 'inquiries#edit_inquiry'
  get 'inquiries/:id/email_ip' => 'inquiries#email_ip'
  get 'inquiries/:id/rslve_no_chng' => 'inquiries#resolve_no_change'
  get 'inquiries/:id/rslve_ip_chng' => 'inquiries#resolve_ip_change'
  patch 'inquiries/:id/edit_status' => 'inquiries#edit_status'
  get 'inquiries/:id/set_show_on_web' => 'inquiries#set_show_on_web'
  get 'inquiries/:id/deg_response' => 'inquiries#resolve_deg_response'
  get 'inquiries/:id/internal_resolution' => 'inquiries#resolve_internal'
  post 'users/admin_new' => 'users#admin_create_user'
  get 'password_reset/:email_key' => 'users#password_reset', as: 'reset_path'
  post 'users/set_password' => 'users#set_password'

  post 'inquiries/:id/delete_attachment/:attach_num' => 'inquiries#delete_attachment'

  get "/404" => "errors#not_found"
  get "/422" => "errors#unacceptable"
  get "/500" => "errors#internal_error"

  get 'reporting/weekly_snapshot' => 'inquiries#weekly_snapshot'
  get 'error_log' => 'inquiries#download_errors'

  resources :users
  resources :blogs
  resources :information_providers

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

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
