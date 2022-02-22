Rails.application.routes.draw do

  root to: 'homes#top'
  # HTML
  resources :html, only: %i[index]
  get '/html/responsive', to: 'html#responsive'

  # Ruby
  resources :ruby, only: %i[index]

end
