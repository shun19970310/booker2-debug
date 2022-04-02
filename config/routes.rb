Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]

  resources :books do
    resource :favorites, only: [:create, :destroy]
  end

  resources :books do  #booksコントローラへのルーティング
    resources :comments, only: [:create, :destroy]  #commentsコントローラへのルーティング
  end

  resources :users, only: [:index,:show,:edit,:update]

  resources :users do
    resource :relationships, only: [:cretae, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
