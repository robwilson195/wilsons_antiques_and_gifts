require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('antiques_controller')
require_relative('wholesalers_controller')
require_relative('auctions_controller')
require_relative('../models/antique.rb')
require_relative('../models/auction.rb')
require_relative('../models/wholesaler.rb')
require_relative('../models/gift.rb')
require_relative('../models/type.rb')
also_reload('../models/*')

# NEW
get '/gifts/new' do
  @wholesalers = Wholesaler.all_by_name
  @types = Type.all[:gifts]
  erb (:"gifts/new")
end

# CREATE
post '/gifts' do
  gift = Gift.new(params)
  gift.save
  redirect to '/gifts/' + gift.id.to_s
end

# SHOW
get '/gifts/:id' do
  @gift = Gift.find(params["id"].to_i)
  erb (:"gifts/show")
end

# EDIT
get '/gifts/:id/edit' do
  @wholesalers = Wholesaler.all_by_name
  @types = Type.all[:gifts]
  @gift = Gift.find(params["id"])
  erb (:"gifts/edit")
end

# UPDATE
post '/gifts/:id' do
  Gift.new(params).update
  redirect to '/gifts/' + params["id"]
end

# DELETE
post '/gifts/:id/delete' do
  Gift.find(params["id"]).delete
  redirect to '/'
end
