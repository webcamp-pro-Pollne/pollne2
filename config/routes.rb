Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions: "customers/sessions"
  }

root "items#top"

resource :customers, only: [:show, :edit, :update]
get "customers/leave" => "customers#leave"
patch "customers/withdraw" => "customers#withdraw"

resources :addresses, except: [:new, :show]
resources :orders, only: [:new, :index, :show, :create]
post "orders/confirm" => "orders#confirm"
get "orders/done" => "orders#done"

end
