require 'rack-flash'

class RecipesController < ApplicationController
  use Rack::Flash

  # action to display all recipes
  get '/recipes' do
    if is_logged_in?(session)
      @recipes = Recipe.all
      erb :'recipes/index'
    else
      redirect '/login'
    end
  end

  #action to display new recipe form
  get '/recipes/new' do
    if is_logged_in?(session)
      @categories = Category.all
      erb :'recipes/new'
    else
      redirect '/login'
    end
  end

  #action to create a new recipe
  post '/recipes' do
    if is_logged_in?(session)
      @user = current_user(session)
      if params[:name] == ""
        redirect "/recipes/new"
      else
        @recipe = @user.recipes.build(name: params[:name], description: params[:description], ingredients: params[:ingredients], directions: params[:directions], cook_time: params[:cook_time])

        @recipe.category_ids = params[:categories]

        if @recipe.save
          flash[:message] = "Successfully Created Recipe."
          redirect ("/recipes/#{@recipe.slug}")
        else
          redirect "/recipes/new"
        end
      end
    else
      redirect '/login'
    end
  end

  #works but has no functionality to add to user
  # post '/recipes' do
  #   @recipe = Recipe.new
  #   @recipe.name = params[:name]
  #   @recipe.description = params[:description]
  #   @recipe.ingredients = params[:ingredients]
  #   @recipe.directions = params[:directions]
  #   @recipe.cook_time = params[:cook_time]
  #
  #   @recipe.category_ids = params[:categories]
  #   @recipe.save
  #   redirect ("/recipes/#{@recipe.slug}")
  # end

  #action to show an individal recipe
  get '/recipes/:slug' do
    @recipe = Recipe.find_by_slug(params[:slug])
    erb :'recipes/show'
  end

  #action to display edit form
  get '/recipes/:slug/edit' do
    if is_logged_in?(session)
      @recipe = Recipe.find_by_slug(params[:slug])
      @categories = Category.all
      if @recipe.user == current_user(session)
        erb :'recipes/edit'
      else
        flash[:message] = "You can't edit another user's recipe."
        redirect ("/recipes/#{@recipe.slug}")
      end
    else
      redirect '/login'
    end
  end

  #action to edit a single recipe
   patch '/recipes/:slug' do
    @recipe = Recipe.find_by_slug(params[:slug])
      if is_logged_in?(session) && params[:name] == ""
        redirect ("/recipes/#{@recipe.slug}/edit")
      elsif is_logged_in?(session) && @recipe.user == current_user(session)
        @recipe.update(name: params[:name], description: params[:description], ingredients: params[:ingredients], directions: params[:directions], cook_time: params[:cook_time])
        @recipe.category_ids = params[:categories]
        flash[:message] = "Successfully Updated Recipe."
        redirect ("/recipes/#{@recipe.slug}")
      else
        redirect '/login'
      end
    end

    #action to delete a recipe
    post '/recipes/:slug/delete' do
       @recipe = Recipe.find_by_slug(params[:slug])
       if is_logged_in?(session) && current_user(session) == @recipe.user
         @recipe.destroy
         flash[:message] = "Successfully Deleted Recipe."
         redirect '/recipes'
       else
         flash[:message] = "You can't delete another user's recipe."
         redirect ("/recipes/#{@recipe.slug}")
       end
     end
end
