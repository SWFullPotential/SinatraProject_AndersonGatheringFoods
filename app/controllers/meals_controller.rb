class MealsController < ApplicationController

  get '/meals' do 
    redirect_to_if_not_logged_in
    @meals = Meal.all
    erb :'meals/index'
  end
  
  get '/meals/new' do 
    redirect_to_if_not_logged_in
    erb :'meal/new'
  end
  
  post '/meals' do 
    meal = current_user.meals.build(params)
    if meal.save 
      redirect '/meals'
    else
      redirect '/meals/new'
    end
  end
  
  get '/meals/:id' do 
    redirect_to_if_not_logged_in
    set_meal
    erb :'meals/show'
  end

  get '/meals/:id/edit' do 
    set_meal  
    erb :'/meals/edit'
  end

  patch '/meals/:id' do 
    set_meal
    if @meal.update(params)
      redirect '/meals'
    else
      redirect "/tweets/#{@meal.id}/edit"
    end
  end
  
  private
  def set_meal
    @meal = Meal.find_by_id(params[:id])
    end
end
