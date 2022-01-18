class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end
  
  def create
    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token.first(6)
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    @user = User.new(sign_up_params)
    unless @user.valid?
      render :new
      return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    @info = @user.build_info
    render :new_info
  end

  def create_info
    @user = User.new(session["devise.regist_data"]["user"])
    @info = Info.new(info_params)
     unless @info.valid?
      render :new_info
      return
     end
    @user.build_info(@info.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
  end

  private

  def info_params
    params.require(:info).permit(:last_name, :last_name_kana, :first_name, :first_name_kana, :birthday)
  end

end
