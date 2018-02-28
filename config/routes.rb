Rails.application.routes.draw do
  resources :job_reports
  resources :jobs
  resources :customers
  root to: 'visitors#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    invitations: 'users/invitations',
  }

  namespace :admin do
    resources :users
  end
end
