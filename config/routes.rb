Rails.application.routes.draw do
  root to: 'home#top'
  resources :shops
  resources :books do
    resources :reviews
  end
end
