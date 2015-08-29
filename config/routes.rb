Rails.application.routes.draw do
  
  resources :entries, defaults: { format: 'json' }
  devise_for :users
  
  root 'dosomething#index'
  match ":controller(/:action(/:id))", :via => [:post,:get]
end
