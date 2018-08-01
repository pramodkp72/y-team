Rails.application.routes.draw do
  get 'place_comments/Index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :places
  resources :users
  resources :sessions
  resources :events
  resources :nearmes
  resources :profiles
  resources :nearmelists
  resources :categories
  resources :place_comments
end
