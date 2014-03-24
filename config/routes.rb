BetterServed::Application.routes.draw do

  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"

  resources :dashboard, only: :index

  devise_for :users, controllers: {}, skip: [:sessions]
  devise_scope :user do
    get "signup" => "registrations#new", as: :signup
    post "signup" => "registrations#new", as: :signup_post
    get 'login' => 'sessions#new', as: :new_user_session
    post 'login' => 'sessions#create', as: :user_session
    delete 'logout' => 'sessions#destroy', as: :destroy_user_session
  end
  
  namespace :admin do
    root "base#index"
    resources :users
  end

  root "pages#home"

end
