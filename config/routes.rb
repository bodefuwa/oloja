Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login'  => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

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
  
  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root 'shop#index', as: 'shop', via: :all
  end
end
