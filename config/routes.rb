Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :photos


  namespace :api, defaults:  { format:  :json } do
    post "login" => "auth#login"
    post "logout" => "auth#logout"
    resources :users
    resources :photos do
      collection do
        get :all
        get :random
      end
    end
  end



end
