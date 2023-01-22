Rails.application.routes.draw do


  get 'homes/top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'homes/about' => 'homes#about', as: 'about'
  # post 'books' => 'books#create'


  resources :books, only: [:new, :index, :show, :edit, :create]
  resources :users, only: [:new, :show, :edit, :create]
  root to: 'homes#top'

end
