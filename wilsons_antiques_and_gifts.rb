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
  @gifts = Gift.all_by_name
  @antiques = Antique.all_by_name
  erb ( :index )
end

# http://localhost:4567?gift_sort_by=type&antique_sort_by=auction
# requested_sort_by = params['gift_type']
# # get requested sort_by from params
# @current_gift_sort_by = params['gift_sort_by']
#
# @sorted_gifts = Gift.sorted_by(requested_sort_by)
# @antiques = Antique.all_by_name
