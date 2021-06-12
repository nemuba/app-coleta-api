# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      api_guard_routes for: "users", controller: {
        registration: "users/registration",
        authentication: "users/authentication"
      }

      resources :system_modules, path: "systemmodules"

      namespace :collect do
        resources :profiles
        resources :products
        resources :collects
        resources :users, except: %w[create]
      end
    end
  end
end
