require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('gifts_controller')
require_relative('antiques_controller')
require_relative('wholesalers_controller')
require_relative('../models/antique.rb')
require_relative('../models/auction.rb')
require_relative('../models/wholesaler.rb')
require_relative('../models/gift.rb')
also_reload('../models/*')

# INDEX
get '/auctions' do
  @auctions = Auction.all_by_date
  erb (:"auctions/index")
end

# NEW
get '/auctions/new' do
  erb (:"auctions/new")
end

# CREATE
post '/auctions' do
  Auction.new(params).save
  redirect to '/auctions'
end

# SHOW
get '/auctions/:id' do
  @auction = Auction.find(params["id"].to_i)
  erb (:"auctions/show")
end

# DELETE
post '/auctions/:id/delete' do
  auction = Auction.find(params["id"].to_i)
  auction.delete
  redirect to '/auctions'
end
