Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user
  get      'chatroom', to: 'chatroom#index'
  get      'sign_in',  to: 'session#new'
  post     'sign_in',  to: 'session#create'
  delete   'sign_out', to: 'session#destroy'
  root to: 'chatroom#index'
end
