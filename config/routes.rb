Rails.application.routes.draw do

  root to: 'user_sessions#new'

  get  'recipes'       => 'recipe#index',  :as => 'recipes_list'
  get  'recipe'        => 'recipe#new',    :as => 'new_recipe'
  post 'recipe/create' => 'recipe#create', :as => 'create_recipe'
  get  'recipe/:id'    => 'recipe#show',   :as => 'view_recipe'

  get 'login'  => 'user_sessions#new',     :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout
  resources :user_sessions, only: [:create]

  get 'user/new'      => 'users#new',    :as => 'new_user'
  get 'user'          => 'users#edit',   :as => 'user'
  patch 'users/edit'  => 'users#update', :as => 'update_user'
  post 'users/create' => 'users#create', :as => 'create_user'

end
