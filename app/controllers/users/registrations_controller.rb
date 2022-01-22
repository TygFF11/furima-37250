class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end
  
  def create
    if params[:sns_auth] == "true"
      pass = Devise.friendly_token.first(6)
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    super
  end

  private


end
