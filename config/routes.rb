Rails.application.routes.draw do


   #管理者
  get '/admin', to: 'admin/homes#top'
  devise_for :admins
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
        put :withdraw
      end
    end
    resources :orders, only:[:index, :create, :show, :new] do
      collection do
       get :confirm
       get  :complete
      end
    end

    resources :cart_items, only:[:index, :update, :destroy, :create] do
      collection do
        delete :destroy_all
      end
    end
    resources :addresses, only:[:index, :create, :edit, :update, :destroy]
    resources :items, only:[:index, :show]

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

