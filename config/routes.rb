Rails.application.routes.draw do
  get 'items/index'
  get 'items/new'
  get 'items/show'
  get 'items/create'
  get 'items/update'
  get 'items/destroy'
  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'users/update'
  get 'users/destroy'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
