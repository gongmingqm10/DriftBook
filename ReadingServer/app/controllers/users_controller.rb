class UsersController < ApplicationController
    def new
    end

    def show

    end

    def create
      @user = User.new(params[:user])
      @user.save

      render plain: params[:user].inspect
    end


    def session
      user = User.authenticate(params[:email], params[:password])
      
      if user
        render status: :ok
      else
        render status: :not_found
      end
    end


end
