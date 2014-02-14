class UserController < ApplicationController
    def add
        @user = User.new(name: params[:user], password: params[:password])
        @user.count = 1
        if @user.save
            render json: {errCode: User.SUCCESS, count: 1}
        else
            message = @user.errors.values[0]
            render json: {errCode: message}
        end
    end

    def login
        @user = User.where(name: params[:user], password: params[:password])
        if @user.nil?
            render json: {errCode: User.RR_BAD_CREDENTIALS} 
        else
            @user.update(count: @user.count + 1 )
            render json: {errCode: User.SUCCESS, count: @user.count}
        end
    end

    def index
        render "client"
    end

    private
        def user_params
        params.require(:user).permit!
        params.require(:password).permit!
        end
end
