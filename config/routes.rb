# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :administrator do
      resources :admins
      resources :users
      resources :patients
      resources :enqueues

      root to: "admins#index"
    end
  root to: "application#index"

  devise_for :admins, path: "admin", skip: [:registrations], controllers: {
    sessions: "admins/sessions",
    passwords: "admins/passwords",
  }

  devise_for :users, path: "user", skip: [:registrations], controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
  }

  # Disable new registrations
  as :admin do
    get "admin/edit" => "admins/registrations#edit", as: "edit_admin_registration"
    put "admin" => "admins/registrations#update", as: "admin_registration"
  end

  as :user do
    get "user/edit" => "users/registrations#edit", as: "edit_user_registration"
    put "user" => "users/registrations#update", as: "user_registration"
  end

end
