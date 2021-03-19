Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }
  
  devise_for :customers, controllers: {
    sessions: "customers/sessions"
  }

root "items#top"
get "about" => "items#about"
resources :items, only: [:index, :show]
  namespace :admins do
    resources :items
  end

resource :customers, only: [:show, :edit, :update]
get "customers/leave" => "customers#leave"
patch "customers/withdraw" => "customers#withdraw"
  namespace :admins do
    resources :customers, only: [:index, :show, :edit, :update]
  end

resources :addresses, except: [:new, :show]

resources :orders, only: [:new, :index, :show, :create]
  namespace :admins do
    resources :orders, only: [:show, :update]
    get "admins" => "admins/order#top"
  end

namespace :admins do
    resources :genres, only: [:index, :edit, :create, :update]
end

namespace :admins do
    resources :order_details, only: [:update]
end
post "orders/confirm" => "orders#confirm"
get "orders/done" => "orders#done"
get 'search/search'
end
