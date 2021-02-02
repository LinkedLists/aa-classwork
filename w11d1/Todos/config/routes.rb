Rails.application.routes.draw do
  root to: 'static_pages#root'

  resources :todos, only: [:index, :show, :update, :destroy, :create]
end
