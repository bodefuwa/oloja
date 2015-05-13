Rails.application.routes.draw do
  get 'admin/index'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users
  resources :orders
  resources :line_items
  resources :baskets
  
  get 'shop/index'
  
  resources :products do
  	get :who_bought, on: :member
  end
  
  root 'shop#index', as: 'shop'
end
