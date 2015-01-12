Rails.application.routes.draw do
  root to: 'welcome#index'
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  namespace :api do 
    namespace :v1 do 
      resources :articles, except: [:new, :edit]
      resources :comments, except: [:new, :edit]
    end
  end
end
