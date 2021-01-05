Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/cats', 'cats#index' as cats
  # resources :cats


  get '/cats', to: 'cats#index', as: 'display_cat'
  get '/cats/new', to: 'cats#new', as: 'new_cat'
  post '/cats', to:'cats#create', as: 'create_cat'

  get '/cats/:id', to: 'cats#show', as: 'show_cat'
  patch '/cats/:id', to: 'cats#update', as: 'update_cat'
  resources :cats, only: [:edit]
  
  delete '/cats/:id', to: 'cats#delete', as: 'delete_cat'
end
