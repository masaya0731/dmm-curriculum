Rails.application.routes.draw do

  root to: 'homes#top'
  get '/reviews_top', to: 'homes#reviews_top'

  # HTML
  resources :html, only: %i[index]
  get '/html/responsive', to: 'html#responsive'

  # Ruby
  resources :ruby, only: %i[index]

  # Bookers1
  resources :reviews

end
