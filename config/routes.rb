Rails.application.routes.draw do

  get 'messages/new', to: 'messages#new', as: 'messages_new'
  post 'messages', to: 'messages#create'

  get 'messages/index', to: 'messages#index', as: 'messages_index'

  get 'messages/:id', to: 'messages#show', as: 'messages_show'

  get 'messages/:id/edit', to: 'messages#edit', as: 'messages_edit'
  patch 'messages/:id', to: 'messages#update', as: 'messages_update'

  delete 'messages/:id', to: 'messages#delete', as: 'messages_delete'
  get 'users/index'
  devise_for :users, controllers: {
        sessions: 'users/sessions', registrations: 'users/registrations'
      }
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get', as: 'users_show'
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
