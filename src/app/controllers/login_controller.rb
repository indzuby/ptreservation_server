class LoginController < ApplicationController


  before_action :checked_login, only: [:update_password,:logout]


  def login
    usr = User.authenticate(params[:email], params[:password])
    if usr then
      reset_session
      session[:usr] = usr.id
      render nothing: true, status: :ok
    else
      render nothing: true, status: :not_found
    end
  end

  def logout
    reset_session
    render nothing: true, status: :ok
  end

  def dup_email
    @user = User.find_by_email(params[:email])
    if @user.nil?
      render nothing: true, status: :ok
    else
      render nothing: true, status: :multi_status
    end
  end


  def update_password

    if @usr.nil?
      render nothing: true, status: :no_content
    else
      user = @usr
      user.password = params[:password]
      user.save
      render nothing: true, status: :ok
    end
  end

end
