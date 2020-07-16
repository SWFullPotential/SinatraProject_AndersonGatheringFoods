class UserController < ApplicationController
    # use Rack::Flash

    get "/signup" do 
        erb :'users/new'
      end
    
    post "/signup" do 
        @user = User.new(username: params[:username], password: params[:password])
            if @user.save
            session[:user_id] = user.id 
            redirect "/new"
            else
            redirect "/error"
            end
    end 

    get '/users' do 
        @users = User.all 
        erb :'/users/index'
    end

    post '/users' do 
        @user = User.create(params[:user])
    end
    

end
