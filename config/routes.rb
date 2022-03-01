Rails.application.routes.draw do
  devise_for :users

  # カリキュラム一覧
  root to: 'homes#top'

  # Bookers1 topページ
  get '/reviews_top', to: 'homes#reviews_top'

  # Bookers2 top aboutページ
  get '/again_top', to: 'homes#again_top'
  get '/again_about', to: 'homes#again_about'

  # HTML
  resources :html, only: %i[index]
  get '/html/responsive', to: 'html#responsive'
  # HTML開発スキルアップ
  get 'html/skillup', to: 'html#skillup'

  # Ruby
  resources :ruby, only: %i[index]

  # Bookers1
  resources :reviews, except: %i[new]

  # Bookers2
  resources :again_users, except: %i[new create destroy]
  resources :again_books, except: %i[new] do
    resource :again_favorites, only: %i[create destroy]
  end
end
