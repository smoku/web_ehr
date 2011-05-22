Webehr::Application.routes.draw do
  
  root :to => "profiles#index"
  
  resources :profiles, :except => [:show] do
    resources :medications, :except => [:show]
    resources :results, :except => [:show]
  end
  
  resources :users, :only => [:index]
  
  resource :account, :only => [:show, :edit, :update] do
    get :edit_password
    put :update_password
  end
  
  devise_for :users

  namespace :api do
    resources :profiles, :only => [:index] do
      resources :medications, :only => [:create, :destroy]
      resources :results, :only => [:create, :destroy]
    end
  end
  
end
