Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get 'parties/new'
  get 'parties/show'

  post 'results', to: 'parties#results'

end
