require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/gift_controller')
require_relative('controllers/antique_controller')
require_relative('controllers/wholesaler_controller')
require_relative('controllers/auction_controller')
also_reload('./models/*')

get "/" do
  erb( ":index" )
end
