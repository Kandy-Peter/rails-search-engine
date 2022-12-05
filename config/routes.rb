Rails.application.routes.draw do
  root to: 'search#index'
  post 'search' => 'search#search'
  get 'analytics' => 'analytics#index', as: 'analytics'
end

