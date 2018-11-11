require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('antiques_controller')
require_relative('wholesalers_controller')
require_relative('auctions_controller')
require_relative('../models/antique.rb')
require_relative('../models/auction.rb')
require_relative('../models/wholesaler.rb')
require_relative('../models/gift.rb')
also_reload('../models/*')

# SHOW

get '/gifts/:id' do
  @gift = Gift.find(params["id"].to_i)
  erb (:"gifts/show")
end
