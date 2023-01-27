Rails.application.routes.draw do

  devise_for :users
  get 'home/top'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/about' => 'homes#about', as: 'about'
  # post 'books' => 'books#create'
  patch 'books/:id' => 'books#update', as: 'update_list'
  delete 'books/:id' => 'books#destroy', as: 'destroy_list'
  get 'books' => 'books#books', as: 'book_list'
  get 'users' => 'users#users', as: 'use'
  delete '/users/sign_out' => 'users#destroy', as: 'logout'

  resources :books, only: [:new, :index, :show, :edit, :create] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:new, :show, :edit, :create, :update]
  root to: 'homes#top'

end
