class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end
  
  def create
    # binding.pry
    if params[:sns_auth] == "true"
      pass = Devise.friendly_token.first(6)
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    super
  end

  private

  def info_params
    params.require(:info).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :birthday)
  end

end
