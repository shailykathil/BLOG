Rails.application.routes.draw do
  devise_for :users
  root 'blogs#index'
  resources :blogs do
  resources :comments
  resources :comments do
  resources :replies
  end
  end
  #root 'blogs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end