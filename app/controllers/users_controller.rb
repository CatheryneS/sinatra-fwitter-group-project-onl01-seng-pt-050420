class UsersController < ApplicationController

    get '/login' do
        erb :"/users/login"
    end

    post '/login' do
        @user = User.find_by(username: params[:user][:username])
        
        if @user && @user.authenticate(params[:user][:password])
          session[:id] = @user.id
          redirect "/users/#{@user.id}"
        else
          redirect '/login'
        end
    end

    get '/signup' do
        erb :'/users/signup'
    end


end
