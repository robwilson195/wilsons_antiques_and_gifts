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
  @gift_sort_stick = params["gift_sort"] if params["gift_sort"]
  @antique_sort_stick = params["antique_sort"] if params["antique_sort"]

  @gifts = Gift.all_by_name if @gift_sort_stick == "name"
  @gifts = Gift.all_by_type if @gift_sort_stick == "type"
  @gifts = Gift.all_by_wholesaler if @gift_sort_stick == "wholesaler"
  @gifts = Gift.all_by_purchase_price if @gift_sort_stick == "purchase_price"
  @gifts = Gift.all_by_sale_price if @gift_sort_stick == "sale_price"
  @gifts = Gift.all_by_quantity if @gift_sort_stick == "quantity"

  @antiques = Antique.all_by_name if @antique_sort_stick == "name"
  @antiques = Antique.all_by_type if @antique_sort_stick == "type"
  @antiques = Antique.all_by_auction if @antique_sort_stick == "auction"
  @antiques = Antique.all_by_purchase_price if @antique_sort_stick == "purchase_price"
  @antiques = Antique.all_by_sale_price if @antique_sort_stick == "sale_price"

  erb ( :index )
end

# http://localhost:4567?gift_sort_by=type&antique_sort_by=auction
# requested_sort_by = params['gift_type']
# # get requested sort_by from params
# @current_gift_sort_by = params['gift_sort_by']
#
# @sorted_gifts = Gift.sorted_by(requested_sort_by)
# @antiques = Antique.all_by_name
