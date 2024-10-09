Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' , sessions: 'users/sessions'}

  root to: 'homepages#index'
  # devise_for, :users, contollers: {
  # registrations: 'users/registrations', # This controller handles actions related to user sign-up and account management.
  # session: 'users/sessions', # This controller handles actions related to user sign-in and sign-out.
  # omniauth_callbacks: 'users/omniauth_callbacks' # This controller manages the authentication flow when users sign in using external providers like Google, Facebook, etc.
  # }

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'   
    get 'users/verify_two_factor', to: 'users/sessions#verify_two_factor'
    post 'users/verify_two_factor', to: 'users/sessions#verify_two_factor'
  end
end

