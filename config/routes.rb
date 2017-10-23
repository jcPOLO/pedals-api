Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'inventory', to: 'components#inventory'
      resources :projects do
        resources :components
      end
    end
  end
  #
  # ApiDemoApp::Application.routes.draw do
  #   scope '/api' do
  #     scope '/v1' do
  #       scope '/projects' do
  #         get '/' => 'api_projects#index'
  #         post '/' => 'api_projects#create'
  #         scope '/:name' do
  #           get '/' => 'api_projects#show'
  #           put '/' => 'api_projects#update'
  #           scope '/todos' do
  #             get '/' => 'api_todos#index'
  #             post '/' => 'api_todos#create'
  #             scope '/:todo_name' do
  #               get '/' => 'api_todos#show'
  #               put '/' => 'api_todos#update'
  #             end
  #           end
  #         end
  #       end
  #     end
  #   end
  # end

  post 'authenticate', to: 'authentication#authenticate'

  #resource :auth, only: %i[create]
  root to: 'projects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
