Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :plans do
    resources :activities, only: [:new, :create]
    resources :polls, only: [:new, :create]
    resources :messages, only: [:new, :create]
  end
end
