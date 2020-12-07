Rails.application.routes.draw do
  root 'static_pages#home'
  resources :restaurants
  get 'users/show'
  get 'static_pages/home'
  get '/', to: redirect('/static_pages/home')
  resources :restaurant_reviews
  get 'restaurants/:restaurant_id/new_address', to: 'restaurants#new_address'
  post 'restaurants/:restaurant_id/update_address', to: 'restaurants#update_address'
  # post 'restaurant_review/create', to: 'restaurant_reviews#create'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
