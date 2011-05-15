Webehr::Application.routes.draw do
  
  devise_for :users

  resources :medications

  namespace :api do
    resources :profiles, :only => [:index] do
      resources :medications, :only => [:create, :destroy]
      resources :results, :only => [:create, :destroy]
    end
  end
  
end
