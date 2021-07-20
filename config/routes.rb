Rails.application.routes.draw do
  post 'payment/page', to:"payment#create", as: 'payment'

  get 'payment/cancel', to:"payment#cancel", as: 'payment_cancel'
  resources :reviews
  resources :listings
  resources :profiles
  devise_for :users
  root 'home#page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
