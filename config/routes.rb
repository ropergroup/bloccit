Rails.application.routes.draw do

  resources :labels, only: [:show]

  resources :topics do
  resources :posts, except: [:index]
  end

  resources :posts, only: [] do
  resources :comments, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]

  post '/up-vote' => 'votes#up_vote', as: :up_vote
  post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  get 'about' => 'welcome#about'
  root 'welcome#index'

  namespace :api do
       namespace :v1 do
         resources :users, only: [:index, :show]
         resources :topics, only: [:index, :show]
         resources :comments, only: [:index, :show]
         resources :post, only: [:index, :show]
       end
     end
  end
