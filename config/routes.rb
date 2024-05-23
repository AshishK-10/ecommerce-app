Rails.application.routes.draw do

  devise_for :admins
  root "home#index"

  authenticated :admin do
    root to: "admin#index", as: :admin_root
  end

  namespace :admin do
    resources :orders
    resources :categories
    resources :products do
      resources :stocks, shallow: true
    end
  end

  get '/admin', to: 'admin#index'
end
