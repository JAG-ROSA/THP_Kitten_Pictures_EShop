Rails.application.routes.draw do
  get 'avatars/create'
  root 'items#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :items, only: [:show, :index, :update], path: "kittens"
  resources :users, only: [:show, :update, :edit], path: "profile" do 
    resources :avatars, only: [:create]
  end
  resources :carts, only: [:show, :update, :destroy, :create], path: "my_cart"

  resources :cart_items
  post 'cart_items/:id/add' => "cart_items#add_quantity", as: "cart_item_add"
  post 'cart_items/:id/reduce' => "cart_items#reduce_quantity", as: "cart_item_reduce"

  # Routes Stripe Checkout
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end  
end
