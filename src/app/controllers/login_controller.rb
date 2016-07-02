class LoginController < ApplicationController


    before_action :checked_login, only: [:update_password,:logout]

  def login
    usr = User.authenticate(params[:email], params[:password])
    if usr then
      reset_session
      session[:usr] = usr.id

      customer = Customer.find_by_user_id(usr.id)
      trainer = Trainer.find_by_user_id(usr.id)
      if customer.nil?
        render :json => {:name => usr.name,:id => trainer.id}, status: 200
      else
        render :json => {:name => usr.name,:id => customer.id}, status: 201
      end

    else
      render nothing: true, status: :not_found
    end
  end

  def logout
    reset_session
    render nothing: true, status: :ok
  end

  def dup_email
    @usr = User.find_by_email(params[:email])
    if @usr.nil?
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
