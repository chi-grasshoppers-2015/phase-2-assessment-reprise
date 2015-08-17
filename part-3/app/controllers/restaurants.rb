get "/restaurants/new" do
	erb :"restaurants/new"
end

post "/restaurants" do
	@restaurant = Restaurant.new(params[:input])
	@restaurant.creator_id = current_user_id
	
	if @restaurant.save
		redirect "/"
	else
		@error_msgs = @restaurant.errors.full_messages
		erb :"restaurants/new"
	end
end

get "/restaurants/:restaurant_id" do
	@restaurant = Restaurant.find(params[:restaurant_id])
	erb :"restaurants/show"
end

get "/restaurants/:restaurant_id/edit" do
	@restaurant = Restaurant.find(params[:restaurant_id])
	erb :"restaurants/edit"
end

put "/restaurants/:restaurant_id" do
	@restaurant = Restaurant.find(params[:restaurant_id]).update_attributes(params[:restaurant])
	redirect "/"
end

delete "/restaurants/:restaurant_id" do
	@restaurant = Restaurant.find(params[:restaurant_id]).destroy
	redirect "/"
end