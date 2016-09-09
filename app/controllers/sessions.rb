# GET REQUESTS

get "/sessions/login" do
  erb :"/sessions/login"
end

# POST REQUESTS

post "/sessions" do
  @errors = []
  user = User.find_by(username: params[:username])
  if user
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/"
    else
      session.delete(:user_id)
      @errors << "Incorrect password"
    end
  else
    session.delete(:user_id)
    @errors << "Incorrect username"
  end
  # Actually here display the error messages with parital.
  erb :"/sessions/login"
end

# DELETE REQUESTS

# Don't forget to test logout early on.
delete "/sessions" do
  session.delete(:user_id)
  redirect "/"
end
