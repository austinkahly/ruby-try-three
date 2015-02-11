Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  root to: 'welcome#index'
  get 'welcome/index'

  resources :notifications

  namespace :api do 
    namespace :v1 do 
      resources :articles,      except: [:new, :edit]
      resources :comments,      except: [:new, :edit]
      resources :notifications, only: :index do 
        post :mark_all_read,    on: :collection
      end
      resources :users, only: :index do 
        get :current, on: :collection
      end
    end
  end
end
