Rails.application.routes.draw do

  root to: 'homes#top'
  resources :html, only: %i[index]

end
