Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/reviews_top', to: 'homes#reviews_top'
  get '/again_top', to: 'homes#again_top'
  get '/again_about', to: 'homes#again_about'

  # HTML
  resources :html, only: %i[index]
  get '/html/responsive', to: 'html#responsive'

  # Ruby
  resources :ruby, only: %i[index]

  # Bookers1
  resources :reviews

  # Bookers2
  resources :again_users
  resources :again_books

end
