Rails.application.routes.draw do
  
  root 'users#index'
  devise_for :users
  
  resources :users

  resources :photos do
  	resources :comments, only: [:create, :index]
  	resources :likes, only: [:create, :destroy]
  end

  
  resources :comments, only: :destroy


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 	resources :users do
 		member do
 			get :following, :followers
 		end
 	end

 	resources :relationships, only: [:create, :destroy]
 	
end
