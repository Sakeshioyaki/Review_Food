Rails.application.routes.draw do
  root 'static_pages#home'
  resources :restaurants
  get 'users/show'
  get 'static_pages/home'
  get '/', to: redirect('/static_pages/home')
  resources :reviews
  post 'restaurant_review/create', to: 'restaurant_review#create'
  post 'restaurants/:restaurant_id/update_address', to: 'restaurant#update_address'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
