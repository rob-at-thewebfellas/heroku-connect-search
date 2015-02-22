Rails.application.routes.draw do
  resources :companies, :contacts, only: :index
end
