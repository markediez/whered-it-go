Rails.application.routes.draw do
  get "/", to: 'site#index'

  resources :transactions
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
