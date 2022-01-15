require "bcrypt"

class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    # TODO: login users after register, and return jwt token

    user_info = JSON.parse(request.body.read)
    user_info[:id] = SecureRandom.uuid
    user_info[:password] = BCrypt::Password.create(user_info[:password])
    @user = User.new(user_info)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def login
    user_info = JSON.parse(request.body.read)
    user = User.find_by(email: user_info["email"].strip)
    password = BCrypt::Password.new(user.password) unless user.nil?
    if password == user_info[:password]
      payload = { user_id: user.id }
      token = JWT.encode(payload, nil, "HS256")
      render json: { "token" => token, "user_info" => user }
    else
      render json: { message: "undefined users" }, status: :unauthorized
    end
  end

  # PATCH/PUT /users/1
  def update
    # TODO: change params by body
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.permit(:pseudo, :email, :password)
    # params.require(:user).permit(:pseudo, :email, :password)
  end
end
