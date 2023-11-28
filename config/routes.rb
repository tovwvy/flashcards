Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }

  resources :flashcards, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  get 'home/index', to: 'home#index', as: 'home_index'
  get 'home/all_users', to: 'home#all_users', as: 'all_users'
  get 'home/all_flashcards', to: 'home#all_flashcards', as: 'home_all_flashcards'
  get 'home/my_flashcards', to: 'flashcards#my_flashcards', as: 'my_flashcards'
  get 'learn_eng', to: 'learn_eng#index', as: 'learn_eng'
  get 'create_flashcard', to: 'flashcards#new', as: 'create_flashcard'
  root 'home#index'
  
  # Видалив маршрут, який конфліктує з іншим
  # get 'user_flashcards', to: 'home#my_flashcards', as: 'user_flashcards'

  # Додав новий маршрут або може вам потрібно змінити контролер або дію
  # залежно від вашого наміру
  get 'user_flashcards', to: 'home#user_flashcards', as: 'user_flashcards'

  # Збереження решти маршрутів як є
  get '/flip/:id', to: 'home#flip', as: :flip_home
  
end
