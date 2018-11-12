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
  @wholesalers = Wholesaler.all_by_name
  erb (:"wholesalers/index")
end

# NEW
get '/wholesalers/new' do
  erb (:"wholesalers/new")
end

# CREATE
post '/wholesalers' do
  Wholesaler.new(params).save
  redirect to '/wholesalers'
end

# SHOW
get '/wholesalers/:id' do
  @wholesaler = Wholesaler.find(params["id"].to_i)
  erb (:"wholesalers/show")
end

# EDIT
get '/wholesalers/:id/edit' do
  @wholesaler = Wholesaler.find(params["id"].to_i)
  erb (:"wholesalers/edit")
end

# UPDATE
post '/wholesalers/:id' do
  wholesaler = Wholesaler.new(params)
  wholesaler.update
  redirect to '/wholesalers'
end

# DELETE
post '/wholesalers/:id/delete' do
  wholesaler = Wholesaler.find(params["id"])
  wholesaler.delete
  redirect to '/wholesalers'
end
