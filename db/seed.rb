require_relative('../models/auction')
require_relative('../models/antique')
require_relative('../models/wholesaler')
require_relative('../models/gift')
require('pry-byebug')

Antique.delete_all
Gift.delete_all
Wholesaler.delete_all
Auction.delete_all

auction1 = Auction.new({
  "venue" => "Goldenfield Town Hall",
  "collection_date" => '2018-07-25'
  })
auction1.save

auction2 = Auction.new({
  "venue" => "Marmory Comunity Centre",
  "collection_date" => '2018-11-4'
  })
auction2.save

auction3 = Auction.new({
  "venue" => "Melrose Town Hall",
  "collection_date" => '2018-12-02'
  })
auction3.save

antique1 = Antique.new({
  "name" => "Victorian Button Back Armchair",
  "description" => "Red Velvet Armchair from Victorian era, slight marking on rear left leg.",
  "type" => "chair",
  "auction_id" => auction1.id,
  "purchase_price" => "380.00",
  "sale_price" => "450.00",
  "image_url" =>"https://www.sellingantiques.co.uk/photosnew/dealer_handofglory/dealer_handofglory_superhighres_1541701469859-9538949111.jpg"
  })
antique1.save

antique2 = Antique.new({
  "name" => "Fraureuth Gilded Porcelain Cup and Saucer",
  "description" => "The gilded design on the white ground is exquisite and all intact. Both cup and saucer are of square construction with foliate gilded edge.",
  "type" => "tableware",
  "auction_id" => auction1.id,
  "purchase_price" => "110.00",
  "sale_price" => "150.00",
  "image_url" =>"https://www.sellingantiques.co.uk/photosnew/dealer_antiquesbydesign/dealer_antiquesbydesign_superhighres_1526054320352-6020590603.jpg"
  })
antique2.save

antique3 = Antique.new({
  "name" => "Edwardian Mahogany Dressing Stand",
  "description" => "This type of furniture is increasingly popular, being compact, useful and with the fashion for mens grooming and barbering. Excellent condition.",
  "type" => "dressing table",
  "auction_id" => auction1.id,
  "purchase_price" => "300.00",
  "sale_price" => "400.00",
  "image_url" =>"https://www.sellingantiques.co.uk/photosnew/dealer_claytonblakelyantiques/dealer_claytonblakelyantiques_highres_1540490818719-4978718485.jpg"
  })
antique3.save

antique4 = Antique.new({
  "name" => "Alfred Parsons 1847-1920",
  "description" => "Watercolour by Alfred Parsons 1847-1920 RA, RI. Coastal View.",
  "type" => "art",
  "auction_id" => auction2.id,
  "purchase_price" => "650.00",
  "sale_price" => "780.00",
  "image_url" => "https://www.sellingantiques.co.uk/photosnew/dealer_paulgerard/dealer_paulgerard_superhighres_1541695457832-9342633593.jpg"
  })
antique4.save

antique5 = Antique.new({
  "name" => "Victorian British Light Infantry Officers Sword",
  "description" => "Condition is good, blade superbly engraved, consider mid Victorian.",
  "type" => "miscellaneous",
  "auction_id" => auction2.id,
  "purchase_price" => "350.00",
  "sale_price" => "420.00",
  "image_url" => "https://www.sellingantiques.co.uk/photosnew/dealer_Sover/dealer_Sover_superhighres_1540882976549-2827964759.jpg"
  })
antique5.save

wholesaler1 = Wholesaler.new({
  "name" => "Puckator Ltd",
  "description" => "Quality novelties, toys, homeware, jewellery, aromatherapy, collectavles and souvenirs.",
  "contact_number" => "05431 299233",
  "website_url" => "https://www.puckator.co.uk/wholesale/",
  "logo_url" => "https://www.autumnfair.com/__resource/companyProfiles/A7E9E0D-041F-4200-B352-A80EDB305F90-logo.png"
  })
wholesaler1.save

wholesaler2 = Wholesaler.new({
  "name" => "Sparks Gift Wholesalers",
  "description" => "Seasonal gifts and souvenirs.",
  "contact_number" => "05429 112233",
  "website_url" => "https://www.sparksgiftwholesalers.co.uk/",
  "logo_url" => "http://www.thewholesaler.co.uk/upload/sparksgiftlogo.jpg"
  })
wholesaler2.save

wholesaler3 = Wholesaler.new({
  "name" => "Paladone",
  "description" => "Large gift brands at excellent value.",
  "contact_number" => "05311 123678",
  "website_url" => "https://paladone.com/",
  "logo_url" => "https://paladone.com/image/2018%20Logo/logo.png"
  })
wholesaler3.save

gift1 = Gift.new({
  "name" => "Angel Wings Hanging Decoration",
  "description" => "Material: Resin",
  "type" => "decoration",
  "wholesaler_id" => wholesaler1.id,
  "purchase_price" => "0.40",
  "sale_price" => "0.65",
  "quantity" => "20",
  "image_url" => "https://www.puckator.co.uk/wholesale/images/ANG105_001.jpg"
  })
gift1.save

gift2 = Gift.new({
  "name" => "Simon's Cat Shaped Clock",
  "description" => "Material: MDF. Wall mountable.",
  "type" => "furniture",
  "wholesaler_id" => wholesaler1.id,
  "purchase_price" => "8.50",
  "sale_price" => "10.99",
  "quantity" => "8",
  "image_url" => "https://www.puckator.co.uk/wholesale/images/CKP126_001.jpg"
  })
gift2.save

gift3 = Gift.new({
  "name" => "Tropical Plant 3 Piece Vanity Bag Set",
  "description" => "Set Of 3 Vanity Bags With Colourful Tropical Plant Design On. Set Contains 3 Seperate Bags (Priced As A Set)",
  "type" => "accessory",
  "wholesaler_id" => wholesaler2.id,
  "purchase_price" => "14.00",
  "sale_price" => "19.99",
  "quantity" => "5",
  "image_url" => "https://imagefileshost.co.uk/sparksgiftwholesalers/700x700/BAGS03-2.jpg"
  })
gift3.save

gift4 = Gift.new({
  "name" => "Baby Girl Card",
  "description" => "Pink Card With Gold And Silver Star Design And Gold Text. 16cm x 16cm.",
  "type" => "card",
  "wholesaler_id" => wholesaler2.id,
  "purchase_price" => "1.00",
  "sale_price" => "1.99",
  "quantity" => "2",
  "image_url" => "https://imagefileshost.co.uk/sparksgiftwholesalers/700x700/BM111-2.jpg"
  })
gift4.save

gift5 = Gift.new({
  "name" => "Baby Boy Card",
  "description" => "Blue Card With Gold And Silver Star Design And Gold Text. 16cm x 16cm.",
  "type" => "card",
  "wholesaler_id" => wholesaler2.id,
  "purchase_price" => "1.00",
  "sale_price" => "1.99",
  "quantity" => "5",
  "image_url" => "https://imagefileshost.co.uk/sparksgiftwholesalers/700x700/BM110-2.jpg"
  })
gift5.save


gift6 = Gift.new({
  "name" => "Harry Potter Wand Pen",
  "description" => "This black ink pen is a replica of Harry Potter’s famous wand from the movies. This is a truly magical gift for fans of the Harry Potter franchise, and is great for use at home, at work, or at school.",
  "type" => "stationary",
  "wholesaler_id" => wholesaler3.id,
  "purchase_price" => "8.00",
  "sale_price" => "12.99",
  "quantity" => "7",
  "image_url" => "https://cdn.shopify.com/s/files/1/2597/5112/products/hpnbhppenbm_61ca45b4-9bbc-423c-bb9d-2d367b7ace92_large.jpg?v=1527320470"
  })
gift6.save


# binding.pry
# nil
