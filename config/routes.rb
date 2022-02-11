Rails.application.routes.draw do
  resources :display_lines
  resources :awardeds
  resources :contributions
  resources :awards
  resources :types
  resources :projects

  root 'projects#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
