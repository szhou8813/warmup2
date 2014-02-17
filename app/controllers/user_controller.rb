class UserController < ApplicationController
    def add
        @user = User.new(name: params[:user], password: params[:password])
        @user.count = 1
        respond_to do |format|  
            if @user.save
                format.json {
                    render json: {errCode: User.SUCCESS, count: 1}
                }
            else
                message = @user.errors.values[0]
                format.json {
                    render json: {errCode: message}
                }
            end
        end
    end

    def login
        @user = User.where(name: params[:user], password: params[:password])
        respond_to do |format|
            if @user.nil?
                format.json {
                    render json: {errCode: User.RR_BAD_CREDENTIALS} 
                }
            else
                @user.update(count: @user.count + 1 )
                format.json {
                    render json: {errCode: User.SUCCESS, count: @user.count}
                }
            end
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
