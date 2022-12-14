Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #
  constraints(AdminDomainConstraint.new) do
    namespace :admin, path: '' do
      root to: "home#index", as: :admin_root
      devise_for :users, controllers: { sessions: 'admin/sessions' }
      resources :users, path: 'users/clients' do
        resources :increases, path: 'orders/increase', only: [:new, :create]
        resources :deducts, path: 'orders/deduct', only: [:new, :create]
        resources :bonuses, path: 'orders/bonus', only: [:new, :create]
        resources :member_levels, path: 'orders/member-level', only: [:new, :create]
      end
      resources :items, except: :show do
        put :start
        put :pause
        put :end
        put :cancel
      end
      resources :bets do
        put :cancel
      end
      resources :categories, except: :show
      resources :winners do
        put :submit
        put :pay
        put :ship
        put :deliver
        put :publish
        put :remove_publish
      end
      resources :offers, except: :show
      resources :orders do
        put :pay
        put :cancel
      end
      resources :invite_lists, only: :index
      resources :news_tickers, except: :show
      resources :banners, except: :show
      resources :member_level_lists, except: :show
    end
  end

  constraints(ClientDomainConstraint.new) do
    devise_for :users, controllers: { sessions: 'clients/sessions', registrations: 'clients/registrations', omniauth_callbacks: 'clients/omniauth_callbacks' }
    namespace :clients, path: '' do
      root to: "home#index"
      resources :profiles, only: :index
      resources :addresses, except: :show
      resources :invites, only: :index
      resources :lotteries
      resources :shops
      resources :claims
      resources :shares
      scope :orders, path: 'orders', as: 'orders' do
        put "cancel/:order_id", to: 'orders#cancel'
      end
    end
  end

  namespace :api do
    resources :regions, only: :index, defaults: { format: :json } do
      resources :provinces, only: :index, defaults: { format: :json } do
        resources :city_municipalities, only: :index, defaults: { format: :json } do
          resources :barangays, only: :index, defaults: { format: :json }
        end
      end
    end
  end
end