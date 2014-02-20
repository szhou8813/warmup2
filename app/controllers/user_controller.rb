class UserController < ApplicationController
    def add
        name = request["user"]
        password = request["password"]

        @user = User.new(name: name, password: password)
        @user.count = 1
        if @user.save then
            render json: {errCode: User.success.to_s, count: 1.to_s}
        else
            message = @user.errors.values[0]
            render json: {errCode: message}
        end
    end

    def login
        name = request["user"]
        password = request["password"]
        @user = User.where(name: name, password: password).first
        unless @user then
            render json: {errCode: User.err_bad_credentials.to_s} 
        else
            @user.count = @user.count + 1
            @user.save!
            render json: {errCode: User.success.to_s, count: @user.count.to_s}
        end
    end
end
