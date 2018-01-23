Rails.application.routes.draw do
  get 'guesses/new'

  get 'stories/index'

  get 'stories/new'

  get 'stories/edit'

  get 'users/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "users#index"
  
  resources :users
  
  resources :stories do
    resources :guesses
  end
end
