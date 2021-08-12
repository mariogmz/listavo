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

  devise_for :admins, path: "admin", controllers: {
    sessions: "admins/sessions",
    passwords: "admins/passwords",
    registrations: "admins/registrations",
  }

  devise_for :users, path: "user", controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations",
  }
end
