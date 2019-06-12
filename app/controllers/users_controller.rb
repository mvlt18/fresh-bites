class UsersController < ApplicationController

  #action to display all users
  get '/users' do
    @users = User.all
    erb :'users/index'
  end

  #action to find a single user
  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  #action to display signup page
  get '/signup' do
    if is_logged_in?(session)
      redirect '/recipes'
    else
    erb :'/users/signup'
    end
  end

  #action to signup user to a new account
  post '/signup' do
    # binding.pry
    @user = User.new(username: params[:username], email: params[:email], password: params[:password], city: params[:city], state: params[:state] )
      if params[:username] == "" || params[:email] == "" || params[:password] == "" || params[:city] == "" || params[:state] == ""
        redirect '/signup'
      else
        @user.save
        session[:user_id] = @user.id
        redirect '/recipes'
    end
  end

  #action to display login page
  get '/login' do
    if is_logged_in?(session)
      redirect '/recipes'
    else
    erb :'users/login'
    end
  end

  #action to log into account
  post '/login' do
  # binding.pry
  user = User.find_by(:username => params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/recipes'
  end
  redirect '/login'
end

  #action to logout
  get '/logout' do
    if is_logged_in?(session)
      session.clear
      erb :logout
    else
      redirect '/login'
    end
  end

end
