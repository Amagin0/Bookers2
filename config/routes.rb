Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "homes#top"
  get 'home/about' => 'homes#about'

  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] 
  resources :users, only: [:index, :show, :edit, :update]
  
end
