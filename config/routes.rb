Rails.application.routes.draw do
 #管理者
  get '/admin', to: 'admin/homes#top'
  devise_for :admin
  namespace :admin do
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:index, :show, :update]
    resources :order_details, only:[:update]
    resources :items, except:[:destroy]
    resources :genres, only:[:index, :edit, :create, :update]
  end
  #会員
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'
  devise_for :customers , controllers: { registrations: 'customers/registrations' }
  scope module: :public do
      resources :customers, only:[:edit, :update] do
      collection do
        get :my_page
        get :unsubscribe
      end
    end
  end
  resources :cart_items, only:[:index, :update, :destroy, :create]
  delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :addresses, only:[:index, :create, :edit, :update, :destroy]
  resources :items, only:[:index, :show]
  resources :orders, only:[:index, :create, :show, :new]
  post '/orders/confirm' => 'orders#confirm'
  get '/orders/complete' => 'orders#complete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end