Rails.application.routes.draw do
  resources :users
  resources :bill_templates
  resources :reminder_templates
  resources :bills
  resources :reminders
  resources :transactions
  resources :categories

  root 'site#index'
  get '/templates', to: 'site#templates'
  post '/reminder_templates/:id/trigger', to: 'reminder_templates#trigger'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
