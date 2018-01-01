Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :photos


  namespace :api, defaults:  { format:  :json } do
    resources :users, only: [:index, :show, :update, :delete]
    resources :photos, only: [:index, :show, :update, :delete]
  end



end
