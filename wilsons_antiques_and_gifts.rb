require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/gifts_controller')
require_relative('controllers/antiques_controller')
require_relative('controllers/wholesalers_controller')
require_relative('controllers/auctions_controller')
require_relative('models/antique.rb')
require_relative('models/auction.rb')
require_relative('models/wholesaler.rb')
require_relative('models/gift.rb')
also_reload('./models/*')

get '/' do
  erb ( :index )
end
