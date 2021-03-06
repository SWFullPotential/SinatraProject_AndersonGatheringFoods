class UsersController < ApplicationController


    get '/signup' do 
        redirect_to_if_logged_in
        erb :'users/new'
      end
    
    post '/signup' do 
        user = User.new(username: params[:username], password: params[:password])
            if user.save
            login_user(user)
            redirect "/meals"
            else
                flash[:error] = user.errors.full_messages
                redirect "/signup"
            end
    end 

    get '/login' do 
        redirect_to_if_logged_in
        erb :'users/login'
      end 

    post '/login' do 
        user = User.find_by(username: params[:username])

            if user && user.authenticate(params[:password])
            login_user(user)
            redirect "/meals"
            else
            flash[:error] = ["Invalid Username or Password"]
            redirect "/login"
            end
    end

    
    get '/logout' do 
        session.clear 
        redirect "/"
    end
    
end
