require_relative('../gift.rb')
require_relative('../wholesaler.rb')
require('minitest/autorun')
require('minitest/rg')

class GiftTest < Minitest::Test

  def setup
    @wholesaler1 = wholesaler1 = Wholesaler.new({
      "name" => "Puckator Ltd",
      "description" => "Quality novelties, toys, homeware, jewellery, aromatherapy, collectavles and souvenirs.",
      "contact_number" => "05431 299233",
      "website_url" => "https://www.puckator.co.uk/wholesale/",
      "logo_url" => "https://www.autumnfair.com/__resource/companyProfiles/A7E9E0D-041F-4200-B352-A80EDB305F90-logo.png"
      })
      @wholesaler1.save

    @gift1 = Gift.new({
      "name" => "Tropical Plant 3 Piece Vanity Bag Set",
      "description" => "Set Of 3 Vanity Bags With Colourful Tropical Plant Design On. Set Contains 3 Seperate Bags (Priced As A Set)",
      "type" => "accessory",
      "wholesaler_id" => @wholesaler1.id,
      "purchase_price" => "14.00",
      "sale_price" => "19.99",
      "quantity" => "5",
      "image_url" => "https://imagefileshost.co.uk/sparksgiftwholesalers/700x700/BAGS03-2.jpg"
      })
      @gift1.save
  end

  def test_can_sell
      @gift1.sell(3)
      assert_equal(2, @gift1.quantity)
  end

  def test_show_wholesaler
    assert_equal(@wholesaler1.name, @gift1.wholesaler.name)
  end

end
