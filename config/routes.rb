Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root'users#index'

  resources :users, only: [:index, :show, :new, :create] do
    resources :posts, only: [:index, :new, :show, :create] do
      resources :comments, only: [:new, :create]
    end
  end
end
