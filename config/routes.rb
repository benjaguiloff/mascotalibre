# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  ##################### Solicitudes ##################
  # CREATE
  get 'solicitudes/new', to: 'solicitudes#new', as: 'solicitudes_new'
  post 'solicitudes', to: 'solicitudes#create'

  # READ
  get 'solicitudes/index', to: 'solicitudes#index', as: 'solicitudes_index'
  get 'solicitudes/:id', to: 'solicitudes#show', as: 'solicitudes_show'

  # UPDATE
  get 'solicitudes/:id/edit', to: 'solicitudes#edit', as: 'solicitudes_edit'
  patch 'solicitudes/:id', to: 'solicitudes#update', as: 'solicitudes_update'

  # DELETE
  delete 'solicitudes/:id', to: 'solicitudes#delete', as: 'solicitudes_delete'

  ##################### Reseñas ##################
  # CREATE
  get 'reviews/new', to: 'reviews#new', as: 'reviews_new'
  post 'reviews', to: 'reviews#create'

  # READ
  get 'reviews/index', to: 'reviews#index', as: 'reviews_index'
  get 'reviews/:id', to: 'reviews#show', as: 'reviews_show'

  # UPDATE
  get 'reviews/:id/edit', to: 'reviews#edit', as: 'reviews_edit'
  patch 'reviews/:id', to: 'reviews#update', as: 'reviews_update'

  # DELETE
  delete 'reviews/:id', to: 'reviews#delete', as: 'reviews_delete'

  ##################### Mensajes ##################
  resources :conversations do
    resources :messages
  end

  get 'messages/:id/edit', to: 'messages#edit', as: 'messages_edit'
  patch 'messages/:id', to: 'messages#update', as: 'messages_update'

  ##################### Usuarios ##################
  get 'users/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations'
  }
  match '/users', to: 'users#index', via: 'get'
  match '/users/:id', to: 'users#show', via: 'get', as: 'users_show'
  get 'welcome/index'

  ##################### Publicaciones ##################
  # create
  get 'publications/new', to: 'publications#new', as: 'publications_new'
  post 'publications', to: 'publications#create'

  # read
  get 'publications/index', to: 'publications#index', as: 'publications_index'
  get 'publications/:id', to: 'publications#show', as: 'publications_show'

  # update
  get 'publications/:id/edit', to: 'publications#edit', as: 'publications_edit'
  get 'publications/:id/edit_admin', to: 'publications#edit_admin', as: 'publications_edit_admin'
  patch 'publications/:id', to: 'publications#update', as: 'publications_update'
  patch 'publications/update_admin/:id', to: 'publications#update_admin', as: 'publications_update_admin'

  # delete
  delete 'publications/:id', to: 'publications#delete', as: 'publications_delete'

  ##################### Comentarios ##################
  get 'comments/new', to: 'comments#new', as: 'comments_new'
  post 'comments', to: 'comments#create'

  # read
  get 'comments/index', to: 'comments#index', as: 'comments_index'
  get 'comments/:id', to: 'comments#show', as: 'comments_show'

  # update
  get 'comments/:id/edit', to: 'comments#edit', as: 'comments_edit'
  patch 'comments/:id', to: 'comments#update', as: 'comments_update'

  # delete
  delete 'comments/:id', to: 'comments#delete', as: 'comments_delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
