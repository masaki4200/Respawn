Rails.application.routes.draw do



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
    resources :notifications, only: :index
    resources :users do
      get 'favorites' => 'users#favorites', as:'favorites'
      resource :relationships, only: [:create, :destroy]

    get 'follows' => 'relationships#follower', as: 'follows'

    get 'followers' => 'relationships#followed', as: 'followers'
  end
    resources :items do
      resource :favorites, only: [:create, :destroy]
      resource :item_comments, only: [:create, :destroy]
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
    get 'categories/index'
    get 'categories/edit'
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
