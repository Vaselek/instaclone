Rails.application.routes.draw do
  
  root 'users#show'
  devise_for :users
  resources :photos

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 	resources :users do
 		member do
 			get :following, :followers
 		end
 	end

end
