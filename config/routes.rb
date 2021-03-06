Rails.application.routes.draw do

  root to: 'visitors#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    invitations: 'users/invitations',
  }

  namespace :app do
    get 'dashboard' => 'dashboards#index',  as: :dashboards
    resources :job_reports do
      member do
        post :certificate
      end
    end
    resources :jobs do
      member do
        post :repeat
      end
    end
    resources :customers
    resources :users do
      collection do
        get :profile
      end
    end
  end

  namespace :admin do
    resources :users
  end
end
