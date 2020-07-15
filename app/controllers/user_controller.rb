class UserController < ApplicationController
    # use Rack::Flash

    get "/signup" do 
        erb :'users/signup'
      end
    
    post "/signup" do 
        @user = User.new(username: params[:username], password: params[:password])
            if user.save
            session[:user_id] = user.id 
            redirect "/mealpick"
            else
            redirect "/error"
            end
    end 
    

end
