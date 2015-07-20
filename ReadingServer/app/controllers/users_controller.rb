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



end
