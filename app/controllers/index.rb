get '/' do
	redirect '/login'

end

get '/login' do

end

get '/home' do
	@cards=Card.all
	erb :index
end

get '/play' do

end
