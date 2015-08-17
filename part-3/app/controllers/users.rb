get "/users/new" do
	erb :"users/_new"
end

post "/users" do
	@user = User.new(params[:input])
	if @user.save
		login_user(@user)
		redirect "/"
	else
		@entered_email = params[:input][:email]
		@error_msgs = @user.errors.full_messages
		erb :"users/_new"
	end
end

# get "/users/:user_id" do
# 	@user = User.find_by_id(params[:user_id])

# end