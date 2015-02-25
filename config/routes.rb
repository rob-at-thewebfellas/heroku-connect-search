Rails.application.routes.draw do
  resources :companies
  resources :contacts, only: :index

  namespace :salesforce do
    namespace :organisation_a do
      resources :contacts
    end

    namespace :organisation_b do
      resources :contacts
    end
  end

  get 'search' => 'searches#index', as: 'search'
end
