Rails.application.routes.draw do
  
  resources :entries, defaults: { format: 'json' }
  #devise_ios_rails_for :users
  devise_for :users
  
  root 'home#intro'
  match ":controller(/:action(/:id))", :via => [:post,:get]
end
