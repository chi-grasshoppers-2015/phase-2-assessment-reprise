get "/sessions/new" do
	erb :"sessions/new"
end

post "/sessions" do
	@user = User.find_by_email(params[:input][:email])
	@error_msgs = ["User not found"] unless @user

	if @user && @user.password == params[:input][:password]
		login_user(@user)
		redirect "/"
	else
		@entered_email = params[:input][:email]
		@error_msgs ||= ["Password Incorrect"]
		erb :"sessions/new"
	end
end

delete "/sessions" do
	logout_user
	redirect "/"
end