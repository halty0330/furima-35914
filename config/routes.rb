Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :items do
    resources :purchases, only: :create
  end

  resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
  end

end
