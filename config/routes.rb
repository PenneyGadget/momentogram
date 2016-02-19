Rails.application.routes.draw do
  resources :photos, only: [:index, :show]

  get 'follows', to: 'follows#show'

  get 'dashboard', to: 'dashboard#show'
  root to: 'home#show'

  get 'auth/instagram/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
