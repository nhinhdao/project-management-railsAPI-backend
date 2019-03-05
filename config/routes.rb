Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, :only => [:show, :create, :update]
      resources :projects,  :only => [:index, :create, :update, :destroy, :show]
      resources :tasks,  :only => [:index, :create, :update, :show, :destroy]
      post '/login' => 'session#create'
      post '/logout' => 'session#destroy'
      post '/signup' => 'users#create'
    end
  end
end
