require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('gifts_controller')
require_relative('antiques_controller')
require_relative('auctions_controller')
require_relative('../models/antique.rb')
require_relative('../models/auction.rb')
require_relative('../models/wholesaler.rb')
require_relative('../models/gift.rb')
also_reload('../models/*')

# INDEX
get '/wholesalers' do
  erb (:"wholesalers/index")
end

# SHOW
get '/wholesalers/:id' do
  @wholesaler = Wholesaler.find(params["id"].to_i)
  erb (:"wholesalers/show")
end
