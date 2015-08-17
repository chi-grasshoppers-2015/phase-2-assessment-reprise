get "/" do
	if restaurants_exist
		@restaurants = Restaurant.all
	end
	erb :"index"
end