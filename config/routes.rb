Rails.application.routes.draw do

  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end

  devise_for :customers, controllers: {
    sessions: "customers/sessions"
  }


root "items#top"
get "about" => "items#about"
resources :items, only: [:index, :show]
  namespace :admins do
    resources :items
  end

resource :customers, only: [:edit, :update]
get "customers/my_page" => "customers#show"
get "customers/leave" => "customers#leave"
patch "customers/withdraw" => "customers#withdraw"
  namespace :admins do
    resources :customers, only: [:index, :show, :edit, :update]
  end

resources :addresses, except: [:new, :show]

resources :orders, only: [:new, :index, :show, :create]
  namespace :admins do
    resources :orders, only: [:show, :update]
  end
  get "admins" => "admins/orders#top"

namespace :admins do
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
end

namespace :admins do
    resources :order_details, only: [:update]
end
post "orders/confirm" => "orders#confirm"
get "orders/done" => "orders#done"
get 'search/search'


resources :cart_items, only: [:index, :create, :destroy, :update]
delete 'cart_items/destroy_all'

end