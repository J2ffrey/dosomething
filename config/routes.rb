Rails.application.routes.draw do
  
  root 'home#index'
  match ":controller(/:action(/:id))", :via => [:post,:get]
  
  resources :entries, defaults: { format: 'json' }
  
  #get "error", to: 'home#error'

  get "auth(/:provider(/:callback))", to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:index]  
  
end
