Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }

  resources :flashcards do
 
  end

  get 'home/index', to: 'home#index', as: 'home_index'
  get 'home/all_users', to: 'home#all_users', as: 'all_users'
  get 'home/all_flashcards', to: 'home#all_flashcards', as: 'home_all_flashcards'
  get 'home/my_flashcards', to: 'home#my_flashcards', as: 'my_flashcards'
  get 'learn_eng', to: 'learn_eng#index', as: 'learn_eng'
  get 'create_flashcard', to: 'flashcards#new'
  root 'home#index'
end
# config/routes.rb
Rails.application.routes.draw do
  # ...
  get '/flip/:id', to: 'home#flip', as: :flip_home
  # ...
end
