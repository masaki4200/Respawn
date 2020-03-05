Rails.application.routes.draw do
  namespace :users do
    get 'home/top'
  end
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
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
