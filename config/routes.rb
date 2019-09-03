Rails.application.routes.draw do
  devise_for :models
  get 'welcome/index'

  root 'welcome#index'

  #Note Routes
  

  resources :notes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
