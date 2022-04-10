Rails.application.routes.draw do
  get 'projects/public'
  resources :display_lines
  resources :awardeds
  resources :contributions
  resources :awards
  resources :types
  resources :projects

  root 'projects#index'
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
