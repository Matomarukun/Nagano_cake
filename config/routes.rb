Rails.application.routes.draw do

  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :public do
  resources :addresses, :homes, :items, :cart_items, :orders
  end

  namespace :admins do
  resources :homes, :items, :orders , :genres, :order_details
  end

end
