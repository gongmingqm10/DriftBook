class Api::UsersController < ApiController

  def login
    @user = User.authenticate(params[:email], params[:password])
    if @user
      render status: :ok
    else
      render status: :not_found, json: {statusCode: 404, message: 'Invalid username or password'}
    end
  end
end
