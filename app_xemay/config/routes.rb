Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, path: "auth", path_names: {sign_in: "login", sign_out: "logout"}
  root "reviews#index"
  get "maps/index"

  namespace :admin do
    resources :users
    resources :reviews
  end

  resources :users
  resources :reviews do
    resources :comments
  end
end
