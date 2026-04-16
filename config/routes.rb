Rails.application.routes.draw do
  get "pages/home"
  root 'pages#home'
  
  resources :owners, only: [:index, :show]
  resources :pets, only: [:index, :show]
  resources :vets, only: [:index, :show]
  resources :appointments, only: [:index, :show]
end