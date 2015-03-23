Rails.application.routes.draw do
  # Administration
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Users resource
  devise_for :users, :controllers => { :registrations => 'registrations' }
  resources :users

  # Landing page on /
  root :to => 'visitors#index'
end
