Rails.application.routes.draw do
  resources :line_items
  resources :baskets
  get 'shop/index'
  resources :products
  root 'shop#index', as: 'shop'
end
