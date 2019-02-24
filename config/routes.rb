Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user
  get 'chatroom', to: 'chatroom#index'
  get 'sign_in', to: 'session#new', as: 'sign_in'
  root to: 'chatroom#index'
end
