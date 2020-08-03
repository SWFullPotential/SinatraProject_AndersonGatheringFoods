require './config/environment'
require 'sinatra/base'

class ApplicationController < Sinatra::Base

  
  
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "PortfolioProject2"
    register Sinatra::Flash
    # ENV['SINATRA_SECRET']

  end

  get "/" do
    erb :'home' 
  end


  helpers do 
    def redirect_to_if_logged_in
      redirect '/meals' if logged_in?   
    end

    def redirect_to_if_not_logged_in 
      redirect '/login' unless logged_in?
    end

    def logged_in?
      !!session[:user_id]
    end
    def current_user
      User.find(session[:user_id])
    end

    def login_user(user)
      session[:user_id] = user.id 
    end
    
  end

end
