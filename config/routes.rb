Rails.application.routes.draw do
  resources :restaurants
  get 'static_pages/home'
  get '/', to: redirect('/static_pages/home')
  resources :reviews
  post 'restaurant_review/create', to: 'restaurant_review#create'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
