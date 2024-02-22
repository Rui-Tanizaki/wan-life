Rails.application.routes.draw do
  devise_for :users
root 'dog_centers#index'
resources :dogcaves
resources :dogruns
get '/dog_centers', to: 'dog_centers#index', defaults: { format: :json }
end
