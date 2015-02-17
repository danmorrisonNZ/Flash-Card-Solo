get '/' do
	if session[:current_user]
		redirect '/home'
	else
	redirect '/login'
	end
end

get '/login' do
	@error = session[:error]
	erb :login
end

post '/login' do
	# @user = User.create(user_name: params[:username], firstname: params[:firstname] , last_name: params[:lastname] , email: params[:email] , password: params[:password])
	@current_user = User.authenticate(params[:username],params[:password])
	if @current_user
		session[:error] = nil
		session[:current_user] = @current_user
	else
		session[:error] = "Incorrect user name or password, please try again."
	end
	redirect '/'
end

get '/home' do
	@cards=Card.all
	erb :index
end

get '/home/:id' do
	@user= User.find_by(id: params[:id])
	@deck = Deck.find_by(user_id: params[:id])
	erb :show
end

get '/play/:deckname' do
	@deck = Deck.find_by(deck_name: params[:deckname])
	id = @deck.id
	@cards = Card.where(deck_id: id)
	erb :showdeck
end
