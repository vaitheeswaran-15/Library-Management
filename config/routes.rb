Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :categories do
    resources :books do
      resources :comments, only: :create
      resources :genres_books, only: :create
    end
  end

  get '/books', to: 'books#index'
end
