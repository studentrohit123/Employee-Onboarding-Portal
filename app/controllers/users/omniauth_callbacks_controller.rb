# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def google_oauth2
    user = User.from_omniauth(auth)
    byebug
    if user.present?
      sign_out_all_scopes
      flash[:success] = t 'devise_omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect user, event: :authentication
    else
      flash[:alert] = 
        t 'devise_omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized"
      redirect_to_new_user_session_path
    end
  end
  
  private
  
  def auth
    auth ||= request.env['omniauth.auth']
  end
end
