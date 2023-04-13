# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: { invitations: 'invitations' }
  resources :project_details
  resources :projects do
    resources :users do
      resources :project_details, only: %i[new create]
    end
  end

  resources :projects do
    resources :bugs do
      put 'bug_assignment'
      put 'mark_complete'
    end
    resources :project_users, only: [:index]
    resources :project_details, only: [:index]
  end
end
