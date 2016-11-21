Rails.application.routes.draw do
  devise_for :login, path: 'auth', path_names: { 
    sign_up: 'sign-up',
    sign_in: 'sign-in', 
    sign_out: 'sign-out' 
  }

  authenticated :login do
    root 'pages#dashboard', as: :login_root
  end

  root 'pages#home'

  # Requires authentication, redirects
  resources :caregivers
  resources :clients
  resources :visits
end
