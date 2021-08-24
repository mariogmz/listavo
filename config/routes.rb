# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :administrator do
      resources :admins
      resources :users
      resources :patients
      resources :enqueues

      root to: "admins#index"
    end

  root to: "enqueues#index"

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

  scope "/#{I18n.t("routes.patient_enqueues")}/:invite_token", as: :patients do
    resources :appointments, path: "", only: [:new, :create]
  end

  resource :invite_link, only: [:show]

  resources :enqueues, as: "appointments", only: [:index, :destroy], path: I18n.t("routes.enqueues")
  resources :patients, only: [:show], path: I18n.t("routes.patients")
end
