Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'users/index'
  devise_for :users

  root to: 'books#index'

  resources :books, only: [:index, :show, :create] do
    resources :comment, only: [:index, :new, :show, :edit]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
