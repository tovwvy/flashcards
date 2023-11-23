Rails.application.routes.draw do
  devise_for :users
  # Додайте маршрути для користувачів
  resources :users

  # Інші маршрути...
  
  resources :flashcards
  
  get 'home/index', to: 'home#index', as: 'home_index'
  root 'home#index' # залиште тільки цей рядок
end
