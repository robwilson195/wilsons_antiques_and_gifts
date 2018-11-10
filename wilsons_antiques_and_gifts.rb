require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/gift_controller')
require_relative('controllers/antique_controller')
require_relative('controllers/wholesaler_controller')
require_relative('controllers/auction_controller')
require_relative('models/antique.rb')
require_relative('models/auction.rb')
require_relative('models/wholesaler.rb')
require_relative('models/gift.rb')
also_reload('./models/*')

get "/" do
  erb( ":index" )
end
