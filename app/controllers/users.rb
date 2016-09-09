# GET REQUESTS

get "/users/new" do
  erb :"/users/registration"
end

# POST REQUESTS

post "/users" do
  new_user = User.new(params)
  if new_user.save
    session[:user_id] = new_user.id
    redirect "/"
  else
    @errors = new_user.errors.full_messages
    erb :"/users/registration"
  end
end