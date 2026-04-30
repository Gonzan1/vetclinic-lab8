Rails.application.routes.draw do
  root "pages#home"
  
  resources :owners
  resources :pets
  resources :vets
  
  # Rutas anidadas (Nested Resources) para las citas y sus tratamientos
  resources :appointments do
    resources :treatments, only: [:new, :create, :edit, :update, :destroy]
  end
end