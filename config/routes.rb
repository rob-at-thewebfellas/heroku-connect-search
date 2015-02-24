Rails.application.routes.draw do
  resources :companies

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
