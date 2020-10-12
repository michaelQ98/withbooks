Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'

  resources :shops

  resources :books do
    resources :reviews
  end

  resources :themes do
    resources :posts
  end
end
