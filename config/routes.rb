Rails.application.routes.draw do


  namespace :admins do
    get 'items/index'
    get 'items/show'
  end
  get '/search' => 'search#search'
  # namespace :users do
  #   get 'items/index'
  #   get 'items/edit'
  #   get 'items/new'
  # end
# user #
# ---------------------------------------------------

 get '/users/withdraw', to: 'users/users#withdraw'
# devise
  devise_for :users, controllers: {
    sessions:      'devise/users/sessions',
    passwords:     'devise/users/passwords',
    registrations: 'devise/users/registrations'
  }

# 機能
  root 'users/home#top'
  get "home/about" => "users/home#about"
  namespace :users do
    resources :notifications, only: [:index, :destroy]
    resources :users do
      get 'favorites' => 'users#favorites', as:'favorites'
      resource :relationships, only: [:create, :destroy]

    get 'follows' => 'relationships#follower', as: 'follows'

    get 'followers' => 'relationships#followed', as: 'followers'
  end
    resources :items do
      resource :favorites, only: [:create, :destroy]
      resource :comments, only: [:create, :destroy]
    end
  end


# ---------------------------------------------------


# admin #

# devise
devise_for :admins, controllers: {
    sessions:      'devise/admins/sessions',
    passwords:     'devise/admins/passwords',
    registrations: 'devise/admins/registrations'
  }



# 機能
  namespace :admins do
    root 'home#top'
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :items, only: [:index, :show, :destroy] do
      resource :comments, only: [:destroy]
    end
  end





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
