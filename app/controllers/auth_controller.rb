class AuthController < ApplicationController
  def register
    register_params = params.permit(:name, :email, :picture, :password)

    user = User.create(register_params)

    if user.valid?
      secret = Rails.application.secrets.secret_key_base
      token = JWT.encode({user_id: user.id}, secret, "HS256")
      render json: {user: UserSerializer.new(user), token: token}, status: :created
    else
      render json: {error: user.errors.full_messages}, status: :unprocessable_entity
    end 
  end

  def login
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        secret = Rails.application.secrets.secret_key_base
        token = JWT.encode({user_id: user.id}, secret, "HS256")
        render json: {user: UserSerializer.new(user), token: token} 
      else 
        render json: {error: "Invalid Email Address or Password"}, status: :unauthorized 
      end
  end

end
