Rails.application.routes.draw do
  resources :snippets

  mount Sidekiq::Web, at: '/sidekiq'

  root to: 'snippets#index'
end
