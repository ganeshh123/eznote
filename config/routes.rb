Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  #Note Routes
  get '/notes', to: 'notes#index'
  get '/notes/new', to: 'notes#new'
  post '/notes', to: 'notes#create'
  get '/notes/:id', to: 'notes#show', as: 'note'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
