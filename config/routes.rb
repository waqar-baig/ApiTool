Rails.application.routes.draw do
  
  devise_for :users
  
  resources :entities
  resources :projects do
    resources :services do
      resources :apis do
        resources :fields
      end
    end
  end
  
  get 'services'=> 'services#index', as: :all_services
  root to: "home#index"
end
