class LoginController < ApplicationController


  skip_before_filter :verify_authenticity_token


  def login
    @user = User.find_by_email(params[:email])
    if @user.nil?
      render nothing: true,status: :no_content
    else
      password = set_encryption(params[:password])
      p password
      p @user.password
      if password == @user.password
        access_token = generate_access_token @user
        render :json => {:access_token => access_token },status: :created
      else
        render nothing: true,status: :non_authoritative_information
      end
    end
  end

  def dup_email
    @user = User.find_by_email(params[:email])
    if @user.nil?
      render nothing: true,status: :ok
    else
      render nothing: true,status: :multi_status
    end
  end


  def update_password
    token = get_token params[:access_token]
    if token.nil?
      render nothing: true,status: :no_content
    else
      user = User.find(token.user_id)
      user.password = params[:password]
      user.save
      render nothing: true,status: :ok
    end
  end



  private


  def set_encryption(password)
    Digest::SHA1.hexdigest(password)
  end


  def generate_access_token(user)
    datetime = DateTime.now

    Token.where(:user_id => user.id).update_all(is_delete: true)


    token = Token.new
    token.access_token = Digest::SHA1.hexdigest(user.email+datetime.to_s(:db))
    token.created_at = datetime.strftime("yyyy-mm-dd")
    token.updated_at = datetime.strftime("yyyy-mm-dd")
    token.user_id = user.id
    token.save

    token.access_token
  end

  def get_token(access_token)
    token = Token.find_by_access_token(access_token)
    token
  end
end
