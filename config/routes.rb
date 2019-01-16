Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  namespace :admin do
    resources :users
    resources :matches
    resources :match_results
    resources :leagues
    resources :notifications
    resources :news
  end
  get "/admin", to: "admin/users#index"
  resources :users
  resources :matches do
    delete "/score_bets", to: "score_bets#destroy"
    get "/score_bets", to: "score_bets#edit"
    patch "/score_bets", to: "score_bets#update"
    post "/score_bets", to: "score_bets#create"
  end
  resources :leagues do
    get "/rankings", to: "leagues#show"
  end
  resources :teams, only: :index
  resources :news do
    resources :comments
  end
end
