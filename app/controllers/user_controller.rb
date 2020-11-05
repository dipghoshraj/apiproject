class UserController < ApplicationController

    def create
        @user = User.new(user_params)
        if @user.errors.blank? && @user.save
            render json: {message: "user created successfully", id: @user.id}, status:201
        else
            render json: {message: "something wwent wrong"}, status:403
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
