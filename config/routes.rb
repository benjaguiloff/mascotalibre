Rails.application.routes.draw do
  ##REVIEWS
  #CREATE
  get 'reviews/new', to: 'reviews#new', as: 'reviews_new'
  post 'reviews', to: 'reviews#create'

  #READ
  get 'reviews/index', to: 'reviews#index', as: 'reviews_index'
  get 'reviews/:id', to: 'reviews#show', as: 'reviews_show'

  #UPDATE
  get 'reviews/:id/edit', to: 'reviews#edit', as: 'reviews_edit'
  patch 'reviews/:id', to: 'reviews#update', as: 'reviews_update'

  #DELETE
  delete 'reviews/:id', to: 'reviews#delete', as: 'reviews_delete'

  ##MESSAGES
  get 'messages/new', to: 'messages#new', as: 'messages_new'

  post 'messages', to: 'messages#create'

  get 'messages/index', to: 'messages#index', as: 'messages_index'

  get 'messages/:id', to: 'messages#show', as: 'messages_show'

  get 'messages/:id/edit', to: 'messages#edit', as: 'messages_edit'
  patch 'messages/:id', to: 'messages#update', as: 'messages_update'

  delete 'messages/:id', to: 'messages#delete', as: 'messages_delete'
  
  ##USERS
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
