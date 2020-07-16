class SessionController < ApplicationController
    # use Rack::Flash

    get "/login" do 
        erb :'users/login'
      end 

    post "/login" do 
        user = User.find_by(username: params[:username])
            if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect "/new"
            else
            redirect "/error"
            end
    end
    
    get "/error" do 
        erb :'users/error'
      end

    get "/logout" do 
        session.clear 
        redirect "/"
    end
end 
