Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get      'sign_up',  to: 'user#new'
  post     'sign_up',  to: 'user#create'
  get      'chatroom', to: 'chatroom#index'
  get      'user',     to: 'user#show'
  get      'sign_in',  to: 'session#new'
  post     'sign_in',  to: 'session#create'
  delete   'sign_out', to: 'session#destroy'
  post     'message',  to: 'messages#create'
  root to: 'chatroom#index'

  mount ActionCable.server, at: '/cable'
end
