Rails.application.routes.draw do
  devise_for :users
  get 'comment/index'
  get 'comment/new'
  get 'comment/show'
  get 'comment/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
