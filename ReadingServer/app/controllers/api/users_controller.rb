class Api::UsersController < ApiController
  def session
    @user = User.authenticate(params[:email], params[:password])
    if @user
      render status: :ok
    else
      render status: :not_found, json: {statusCode: :not_found, message: "Invalid username or password"}
    end
  end
end
