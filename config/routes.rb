Rails.application.routes.draw do


  namespace :admin do
    # get 'items/index'
    # # get 'items/show'
    # get 'items/:id' => 'items#show'
    # get 'items/edit'
    # get 'items/update'
    # get 'items/new'
    # post 'items/create'
    resources :items, except:[:destroy]
  end


  namespace :admin do
    get 'order_details/update'
  end
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
    patch 'orders/update'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    patch 'customers/update'
  end
  namespace :admin do
    get 'genres/index'
    post 'genres/create'
    get 'genres/edit'
    patch 'genres/update'
  end

  
 #管理者

  get '/admins', to: 'admins/homes#top'
  devise_for :admins

  namespace :admins do
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:index, :show, :update]
    resources :order_details, only:[:update]
    resources :items, except:[:destroy]
    resources :genres, only:[:index, :edit, :create, :update]
  end

  #会員
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'


  devise_for :customers

  resources :customers, only:[:edit, :update]
  get '/customers/my_page' => 'customers#my_page'
  get '/customers/unsubscribe' => 'customers#unsubscribe'
  patch '/end_users/withdraw' => 'end_users#withdraw'

  resources :cart_items, only:[:index, :update, :destroy, :create]
  delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :addresses, only:[:index, :create, :edit, :update, :destroy]
  resources :items, only:[:index, :show]
  resources :orders, only:[:index, :create, :show, :new]
  post '/orders/confirm' => 'orders#confirm'
  get '/orders/complete' => 'orders#complete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :public do
  resources :addresses, :homes, :items, :cart_items, :orders
  end

  namespace :admins do
  resources :homes, :items, :orders , :genres, :order_details
  end

end
