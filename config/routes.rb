BetterServed::Application.routes.draw do

  resources :places do
    resources :items
  end
  resources :premises do
    resources :places
  end
  resources :wizard, only: :index do
    collection do
      get :start
      post :setup
    end
  end

  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"

  resources :dashboard, only: :index

  devise_for :users, skip: [:sessions]
  devise_scope :user do
    get "signup" => "registrations#new", as: :signup
    post "signup" => "registrations#new", as: :create_user
    get 'login' => 'sessions#new', as: :new_user_session
    post 'login' => 'sessions#create', as: :user_session
    delete 'logout' => 'sessions#destroy', as: :destroy_user_session
  end
  
  namespace :admin do
    root "base#index"
    resources :users
  end

  root to: "pages#home"

end
