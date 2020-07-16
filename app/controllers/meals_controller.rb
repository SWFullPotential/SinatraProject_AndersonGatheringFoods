class MealsController < ApplicationController

  get '/meals' do 
    redirect_to_if_not_logged_in
    erb :'meals/index'
  end
    
end
