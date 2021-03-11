Rails.application.routes.draw do
  namespace :admin do
      resources :users
      # resources :carts
      # resources :cart_items
      # resources :categories
      # resources :category_items
      resources :items
      resources :orders
      resources :order_items

      root to: "users#index"
    end
  get 'avatars/create'
  root 'items#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :items, only: [:show, :index, :update], path: "kittens"
  resources :users, only: [:show, :update, :edit], path: "profile" do 
    resources :avatars, only: [:create]
  end
  resources :carts, only: [:show, :update, :destroy, :create], path: "my_cart"

  resources :cart_items

  # Routes Stripe Checkout
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end  
end
