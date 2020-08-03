class MealsController < ApplicationController


  get '/meals' do 
    redirect_to_if_not_logged_in
    @meals = Meal.all
    erb :'meals/index'
  end
  
  get '/meals/new' do 
    # binding.pry
    redirect_to_if_not_logged_in
    erb :'meals/new'
  end
  
  post '/meals' do 
    meal = current_user.meals.build(params) #Returns a new object of the meals type that has been instantiated with attributes and linked to this object through the join table (sets user_id to the current_user's id), but has not yet been saved.
    if meal.save 
      redirect "/meals/#{meal.id}"
    else
      flash[:error] = ["Day & Meal Must be Unique & Cannot Be Empty"]
      redirect '/meals/new'
    end
  end

  get '/meals/:user_id' do
    @meals = Meal.all.where(user_id: :user_id)
    # binding.pry
    erb :'meals/my_meals'
  end
  
  get '/meals/:id' do 
    redirect_to_if_not_logged_in
    # @meals = Meal.all
    set_meal
    erb :'meals/show'
  end
  
  get '/meals/:id/edit' do 
    redirect_to_if_not_logged_in
    set_meal  
    if current_user.owns_meal?(@meal)
    erb :'/meals/edit'
    else
      redirect '/meals'
    end
  end

  patch '/meals/:id' do 
    set_meal
    if @meal.update(day_meal: params[:day_meal], food: params[:food]) 
      redirect '/meals'
    else
      redirect "/meals/#{@meal.id}/edit"
    end
  end

  delete '/meals/:id' do 
    set_meal  
    if logged_in? && current_user.owns_meal?(@meal)
      @meal.destroy 
    end
      redirect '/meals'
  end
  
  private
  def set_meal
    @meal = Meal.find_by_id(params[:id])
    end
end
