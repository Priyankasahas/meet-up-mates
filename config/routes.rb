Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "api/v1/sessions"}

  root to: "api/v1/groups#index"

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      devise_scope :user do
        match '/sessions' => 'sessions#create', :via => :post
        match '/sessions' => 'sessions#destroy', :via => :delete
      end
      resources :groups
      resources :events
    end
  end
  resources :users
end

