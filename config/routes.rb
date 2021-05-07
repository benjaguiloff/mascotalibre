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

  ##################### Publicaciones ##################
  # create
  get 'publications/new', to: 'publications#new', as: 'publications_new'
  post 'publications', to: 'publications#create'

  # read
  get 'publications/index', to: 'publications#index', as: 'publications_index'
  get 'publications/:id', to: 'publications#show', as: 'publications_show'

  # update
  get 'publications/:id/edit', to: 'publications#edit', as: 'publications_edit'
  patch 'publications/:id', to: 'publications#update', as: 'publications_update' 

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
