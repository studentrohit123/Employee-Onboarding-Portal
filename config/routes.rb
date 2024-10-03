Rails.application.routes.draw do
  # get 'employees/index'
  # get 'user/index'
  devise_for :users
  root to: 'user#index'
  
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
end
