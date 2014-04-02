RailsBootstrap::Application.routes.draw do
  root :to => "home#index"

  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :purchase_batches, except: [:edit, :update]

  resources :purchases
  resources :purchasers
  resources :merchants
  resources :products
  resources :users
end