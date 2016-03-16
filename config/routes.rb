Rails.application.routes.draw do
  resources :states
  resources :companies do
    collection do
       get 'export'
    end
  end
 
  root 'home#index'
  devise_for :users, controllers: {registrations: "registrations"}
  
end
