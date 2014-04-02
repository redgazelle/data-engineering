RailsBootstrap::Application.routes.draw do
  root :to => "home#index"

  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users

  resources :purchase_batches, except: :edit

  resources :purchases

  resources :purchasers

  resources :merchants

  resources :products
end