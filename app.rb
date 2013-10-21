%w(omniauth omniauth-twitter sinatra shotgun debugger).each { |dependency| require dependency }

use OmniAuth::Builder do
 provider :twitter, 'Zj6wEWToe9nIFxS6pB1JKg', 'kXPK7zRhkBWaoqwnKG71appbV9w02yyUlj8ZH8y0'
end

enable :sessions

get '/' do
  '<a href="/auth/twitter">sign in with Twitter</a>'
end


get '/auth/twitter/callback' do
  session[:user_token] = env['omniauth.auth']['credentials'][:token] 
  session[:user_secret] = env['omniauth.auth']['credentials'][:secret]
  p '*' * 60
  "Hello World"
  erb :index
end








# helpers do
#   def current_user
#     @current_user ||= User.get(session[:user_id]) if session[:user_id]
#   end
# end