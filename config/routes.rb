Rails.application.routes.draw do
  # Administration
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Read emails in development
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # Users resource
  devise_for :users, :controllers => { :registrations => 'registrations' }
  resources :users

  # Landing page on /
  root :to => 'visitors#index'
end
