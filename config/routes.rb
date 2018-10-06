Rails.application.routes.draw do
  get 'terms', to: 'terms#index', as: :terms
  get 'privacy', to: 'privacies#index', as: :privacy
  resources :posts, only: [:create]
  root to: "posts#new"
  post 'make', to: 'posts#make'
end
