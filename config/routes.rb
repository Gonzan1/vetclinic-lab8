Rails.application.routes.draw do
  devise_for :users
  root "pages#home" 

  # Los módulos de tu clínica
  resources :owners
  resources :pets
  resources :vets
  
  # Citas y tratamientos anidados
  resources :appointments do
    resources :treatments
  end
end