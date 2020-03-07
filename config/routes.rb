Rails.application.routes.draw do


  # namespace :users do
  #   get 'items/index'
  #   get 'items/edit'
  #   get 'items/new'
  # end
# user #
# ---------------------------------------------------

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
    resources :users
    resources :items
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
  end



  get 'items/show'
  get 'items/new'
  get 'items/edit'
  get 'users/show'
  get 'users/edit'
  get 'users/withdraw'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
