Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'inventory', to: 'projects#inventory'
      resources :projects do
        resources :components
      end
    end
  end
  
  post 'authenticate', to: 'authentication#authenticate'
  
  #resource :auth, only: %i[create]
  root to: 'projects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
