class SessionsController < ApplicationController

    def create
        @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
        if @user
            session[:user_id] = @user.id
            token = JsonWebToken.encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),username: @user.email }, status: :200
        else
            render json: { status: 401 }
        end
    end
end
