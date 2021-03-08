Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :items
  resources :users

  # Routes Stripe Checkout
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end
end
