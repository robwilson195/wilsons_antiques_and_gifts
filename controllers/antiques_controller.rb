require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('gifts_controller')
require_relative('wholesalers_controller')
require_relative('auctions_controller')
require_relative('../models/antique.rb')
require_relative('../models/auction.rb')
require_relative('../models/wholesaler.rb')
require_relative('../models/gift.rb')
require_relative('../models/type.rb')
also_reload('../models/*')

# NEW
get '/antiques/new' do
  @auctions = Auction.all_by_date
  @types = Type.all[:antiques]
  erb (:"antiques/new")
end

post '/antiques' do
  Antique.new(params).save
  redirect to '/'
end

#SHOW
get '/antiques/:id' do
  @antique = Antique.find(params["id"].to_i)
  erb (:"antiques/show")
end
