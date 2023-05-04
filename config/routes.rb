Rails.application.routes.draw do
  devise_for :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :categories do
    resources :papers do
      resources :comments, only: :create
      resources :genres_papers, only: :create
      resources :ratings, only: :create
    end
  end

  get '/papers', to: 'papers#index'

  root 'categories#index'
end
