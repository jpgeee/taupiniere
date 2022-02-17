Rails.application.routes.draw do
    mount ActionCable.server => "/cable"
  namespace :admin do
    get 'users/index'
    get 'users/edit', to: "users#edit", as: "user_edit"
    patch 'users/:id/update', to: "users#update", as: "user_update"
    get 'users/new', to: "users#new", as: "user_new"
    post 'users/', to: "users#create", as: "user_create"
    delete 'users/:id', to: "users#destroy", as: "user_destroy"
  end
  namespace :admin do
    #resources :rooms, only: [:index,:new,:create,:destroy,:update]
    get 'rooms/index'
    get 'rooms/edit', to: "rooms#edit", as: "room_edit"
    patch 'rooms/:id/update', to: "rooms#update", as: "room_update"
    get 'rooms/new', to: "rooms#new", as: "room_new"
    post 'rooms/', to: "rooms#create", as: "room_create"
    delete 'rooms/:id', to: "rooms#destroy", as: "room_destroy"
    patch 'rooms/:id/add_user_view_rights', to:"rooms#add_user_view_rights", as:"room_add_user_view_rights"
    patch 'rooms/:id/del_user_view_rights', to:"rooms#del_user_view_rights", as:"room_del_user_view_rights"
    patch 'rooms/:id/add_user_post_rights', to:"rooms#add_user_post_rights", as:"room_add_user_post_rights"
    patch 'rooms/:id/del_user_post_rights', to:"rooms#del_user_post_rights", as:"room_del_user_post_rights"
    patch 'rooms/:id/add_group_rights', to:"rooms#add_group_rights", as:"room_add_group_rights"
    patch 'rooms/:id/del_group_rights', to:"rooms#del_group_rights", as:"room_del_group_rights"
  end
  namespace :admin do
    #resources :groups, only: [:index,:new,:create,:destroy]
    get 'groups/index'
    get 'groups/edit', to: "groups#edit", as: "group_edit"
    get 'groups/new', to: "groups#new", as: "group_new"
    post 'groups/', to: "groups#create", as: "group_create"
    delete 'groups/:id', to: "groups#destroy", as: "group_destroy"
    patch 'groups/:id/add_pupil', to: "groups#add_pupil", as: "group_add_pupil"
    patch 'groups/:id/del_pupil', to: "groups#del_pupil", as: "group_del_pupil"
  end
  #devise_for :users#, controllers: {sessions: "user_sessions"}, only: :sessions#, skip: :registration
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "application#welcome"
  get '/login' => 'user_sessions#new'
post '/login' => 'user_sessions#create'
get '/logout' => 'user_sessions#destroy'


  # rooms
  get 'rooms/:id', to:"rooms#show", as:"room"
  # documents
  get "docs/:id/serve", to: "documents#serve", as: "doc_serve"
  # folders
  get "folders/:id", to: "folders#show", as: "folder_show"
  get "folders/:id/add_child", to:"folders#add_child", as: "folder_add_child"
  post "folders/", to: "folders#create", as: "folder_create"
  delete "folders/:id", to:"folders#destroy", as: "folder_delete"
  get "folders/:id/edit", to: "folders#edit", as: "folder_edit"
  patch "folders/:id/edit", to: "folders#update", as: "folder_update"
  #
  get "folders/:id/docs/add", to:"folders#add_doc", as: "folder_add_doc"
  post "folders/:id/docs/create_or_update", to:"folders#create_or_update_doc", as: "folder_create_or_update_doc"
  get "folders/:id/docs/:doc_id/propose_new_folder", to:"folders#propose_new_folder_for_doc", as: "folder_propose_new_folder_for_doc"
  patch "folders/:id/docs/:doc_id/mode", to:"folders#move_doc", as:"folder_move_doc"
  get "folders/:id/docs/:doc_id/edit", to:"folders#edit_doc", as: "folder_edit_doc"
  patch "folders/:id/docs/:doc_id", to:"folders#update_doc", as: "folder_update_doc"
  delete "folders/:id/docs/:doc_id", to:"folders#destroy_doc", as:"folder_delete_doc"
  # chat_rooms
  get 'chat_rooms/:id', to:"chat_rooms#show", as:"chat_room"
  post "chat_rooms/:id/chat_posts/:id", to: "chat_rooms#send_post", as: "chat_room_send_post"
  get "chat_post/:id/show", to: "chat_rooms#ws_show_post"
  delete "chat_post/:id", to: "chat_rooms#delete_post", as: "chat_room_delete_chat_post"
  get "chat_post/:id/delete", to: "chat_rooms#ws_delete_post"
  get "chat_post/add_attachment", to:"chat_rooms#add_attachment_to_post", as: 'chat_room_add_attachment_to_chat_post'

end
