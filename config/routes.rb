Rails.application.routes.draw do
  resources :reservations, :only => [:index, :new, :create, :show, :destroy]
  resources :flights, :only => [:index, :show]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "flights#index"
end
