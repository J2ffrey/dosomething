Rails.application.routes.draw do
  
  
  # devise_for :users, controllers: {
  #       registrations: 'users/registrations'
  #     }
  
  get 'error' => 'home#error'
  
  root 'home#intro'
  match ":controller(/:action(/:id))", :via => [:post,:get]
  
  
  resources :entries, defaults: { format: 'json' }
  #devise_ios_rails_for :users
  
  
end
