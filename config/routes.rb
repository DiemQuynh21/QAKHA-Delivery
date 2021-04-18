Rails.application.routes.draw do
  devise_for :drivers, skip: [:session, :password, :registration]
  devise_for :partners, skip: [:session, :password, :registration]
  devise_for :users, skip: [:session, :password, :registration], controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  scope "(:locale)", locale: /en|vi/ do
    root 'static_page_partner#index'
    devise_for :users, skip: :omniauth_callbacks
    devise_for :partners, controllers: { sessions: 'sessions' }

    namespace :partners do
      get "/partners", to: "partners#index"
      devise_scope :partner do
        get "/sign_in", to: "sessions#new"
        post "/sign_in", to: "sessions#create"
      end
      resources :categories
      resources :products
    end

    namespace :api, default: {format: :json} do
      namespace :v1 do
        devise_scope :user do
          post "sign_up", to: 'registrations#create'
          post "sign_in", to: 'sessions#create'
          delete "sign_out", to: 'sessions#destroy'
          post "sign_in_driver", to: 'sessions#sign_in_driver'
          get "user", to: 'users#show'
          post "passwords/forgot", to: 'passwords#forgot'
          post "passwords/reset", to: 'passwords#reset'
          get "test_method", to: 'users#test_method'
          post "check_email", to: 'registrations#check_email_exits'
          post "check_phone_number", to: 'registrations#check_phone_number_exits'
          delete "/clear_cart", to: 'carts#clear_cart'
          get "/cart", to: 'carts#show'
          get "/orders/list_vouchers", to: 'orders#list_vouchers'
          get "/orders/voucher", to: 'orders#vouchers_by_partner'
          get "/orders/vouchers", to: 'orders#vouchers_by_partner'
          post "/orders/voucher", to: 'orders#apply_voucher'
          delete "/orders/voucher", to: 'orders#cancel_voucher'
          post "/orders/calc_distance", to: 'orders#location'
          post "check_id_card_driver", to: 'registrations#check_id_card_driver'
          post "check_license_plate_driver", to: 'registrations#check_license_plate_driver'
          get "feedbacks/partner", to: 'feedbacks#fb_partner'
          get "feedbacks/driver", to: 'feedbacks#fb_driver'
          get "/orders/coins_user", to: 'orders#coins_user'
        end
        resources :users, only: %i(index show update)
        resources :types, only: %i(index show)
        resources :partners, only: %i(index)
        resource :carts, only: %i(create update destroy)
        resources :orders, only: %i(create index) do
          resources :feedbacks, only: :create
        end
        resources :addresses, only: %i(index create update destroy)
        resources :order_details, only: %i(index)
      end
    end

    namespace :admin do
      root "base#home"
      get "sign_in", to: 'sessions#new'
      post "sign_in", to: 'sessions#create'
      delete "logout", to: 'sessions#destroy'
      patch "drivers/status/:id", to: 'drivers#update_status', as: :driver_status
      resources :drivers, except: :show
      resources :export_drivers, only: :index
    end
  end
end
