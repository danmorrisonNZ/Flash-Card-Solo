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
	@current_user = User.authenticate(params[:username],params[:password])
	if @current_user
		session[:error] = nil
		session[:current_user] = @current_user
	else
		session[:error] = "Incorrect user name or password, please try again."
	end
	redirect '/'
end

post '/signup' do
	@current_user = User.create(user_name: params[:username], first_name: params[:firstname] , last_name: params[:lastname] , email: params[:email] , password: params[:password])
	if @current_user
		session[:error] = nil
		session[:current_user] = @current_user
	else
		session[:error] = "There was an error while logining in"
	end
	redirect '/'

end

get '/home' do
	@user = session[:current_user]
	@deck = Deck.where(user_id: @user.id)
	erb :index
end

get '/home/:id' do
	@user= User.find_by(id: params[:id])
	@deck = Deck.find_by(user_id: params[:id])
	erb :show
end

get '/play/:deckname' do
	@error = session[:error]
	@deck = Deck.find_by(deck_name: params[:deckname])
	@cards = Card.where(deck_id: @deck.id)
	@current_card = @cards.find_by(id: 1)
	if @current_card
		session[:error] = nil
		session[:card] = @current_card
	else
		session[:error] = "No cards yo!"
	end
	erb :showdeck
end

get '/play/answer' do
	current_card = session[:card]
	if params[:answer] == current_card
		"hurray"
	else
		session[:card]
	end

end


get '/logout' do
	session.clear
	redirect '/'
end
