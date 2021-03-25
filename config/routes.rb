Rails.application.routes.draw do

  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end

  devise_for :customers, skip: :all
  devise_scope :customer do
    get 'customer/sign_up' => 'customers/registrations#new', as: 'new_customer_registration'
    post 'customer' => 'customers/registrations#create', as: 'customer_registration'
    get 'customer/sign_in' => 'customers/sessions#new', as: 'new_customer_session'
    post 'customer/sign_in' => 'customers/sessions#create', as: 'customer_session'
    delete 'customer/sign_out' => 'customers/sessions#destroy', as: 'destroy_customer_session'
    # get 'customer/password' => 'customers/password#new', as: 'new_customer_password'
    # post 'customer/password' => 'customers/password#new', as: 'new_customer_password'
  end


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

resources :orders, only: [:new, :index, :show, :create] do
  collection do
    post 'confirm'#collectionを使うとアクションの名前を書くだけでるーちぃんぐができる(idを伴わないのはmenberでよい)
    get 'complete'
  end
end


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

get 'search/search'


resources :cart_items, only: [:index, :create, :destroy, :update] do
  delete 'destroy_all' #ネストをかけて、destroy_allをグループ化するイメージ
end

end