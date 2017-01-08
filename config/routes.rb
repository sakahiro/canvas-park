# frozen_string_literal: true
Rails.application.routes.draw do
  get 'statics/top'
  get 'statics/about'

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :following, :followers
    end
  end
  resources :works
  resources :relationships, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :stocks, only: [:create, :destroy]

  root to: 'statics#top'
end
