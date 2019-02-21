Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get   'chatroom', to: 'chatroom#index'
  get   'sign_in', to: 'session#new', as: 'sign_in_path'
  root to: 'chatroom#index'
end
