Rails.application.routes.draw do
  resources :companies, :contacts
  get 'search' => 'searches#index', as: 'search'
end
