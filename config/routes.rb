Rails.application.routes.draw do
  resources :snippets

  root to: 'snippets#index'
end
