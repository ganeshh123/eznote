Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  #Note Routes
  get '/notes/new', to: 'notes#new'
  post '/notes', to: 'note#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
