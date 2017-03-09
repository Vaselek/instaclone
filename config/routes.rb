Rails.application.routes.draw do
  resources :photos

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 	resources :users do
 		member do
 			get :following, :followers
 		end
 	end

end
