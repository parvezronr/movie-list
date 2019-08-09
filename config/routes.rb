Rails.application.routes.draw do
  resources :genres do 
  	member do
  		patch 'soft_delete'
      patch 'destroy'
      patch 'restore'      
  	end  	
  end
  resources :movies do
    member do
      patch 'soft_delete'      
      patch 'restore'      
    end
  end
  resources :trash, only: [:index]
  
  root :to => "genres#index"  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
