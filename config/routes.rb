Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :baskets
  
  get 'shop/index'
  
  resources :products do
  	get :who_bought, on: :member
  end
  
  root 'shop#index', as: 'shop'
end
