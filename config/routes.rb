# frozen_string_literal: true

Rails.application.routes.draw do
  root "welcome#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      api_guard_routes for: "users", controller: {
        registration: "users/registration",
        authentication: "users/authentication"
      }

      resources :api_docs, path: "apidocs", only: [:index]
      resources :system_modules, path: "systemmodules"
      resources :system_module_user, path: "systemmoduleuser"
      resources :item_types, path: "itemtypes"
      resources :current_user, path: "currentuser", only: [:show]

      namespace :collect do
        resources :profiles
        resources :products
        resources :collects
        resources :routes
        resources :users, except: %w[create]
        resources :items
        resources :point_histories
      end
    end
  end
end
