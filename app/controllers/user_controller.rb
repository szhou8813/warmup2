class UserController < ApplicationController
    def add
        name = request["user"]
        password = request["password"]

        @user = User.new(name: name, password: password)
        @user.count = 1
        if @user.save then
            render json: {errCode: User.SUCCESS, count:1}
        else
            message = @user.errors.values[0]
            render json: {errCode: message}
        end
    end

    def login
        name = request["user"]
        password = request["password"]
        @user = User.where(name: name, password: password)
        unless @user then
            render json: {errCode: User.RR_BAD_CREDENTIALS} 
        else
            @user.update(count: @user.count + 1 )
            render json: {errCode: User.SUCCESS, count: @user.count}
        end
    end
end
