Rails.application.routes.draw do
  get 'shop/index'
  resources :products
  root 'shop#index', as: 'shop'
end
