Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/reviews_top', to: 'homes#reviews_top'
  get '/again_top', to: 'homes#again_top'

  # HTML
  resources :html, only: %i[index]
  get '/html/responsive', to: 'html#responsive'

  # Ruby
  resources :ruby, only: %i[index]

  # Bookers1
  resources :reviews
end
