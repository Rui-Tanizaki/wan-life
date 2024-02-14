Rails.application.routes.draw do
  devise_for :users
root 'dog_centers#index'
resources :users
end
