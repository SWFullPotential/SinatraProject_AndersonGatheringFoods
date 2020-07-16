class MealController < ApplicationController


    get "/new" do 
        @user = User.find(session[:user_id])
        erb :'meals/new' 
      end
    
end
