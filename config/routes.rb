Rails.application.routes.draw do
  devise_for :logins
  root 'pages#home'
end
