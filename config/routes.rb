Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :following, :followers
    end
  end
  resources :works
  resources :relationships, only: [:create, :destroy]

  root to: 'works#index'
end
