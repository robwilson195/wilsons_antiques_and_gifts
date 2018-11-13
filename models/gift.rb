require_relative('../db/sql_runner')
require_relative('./wholesaler.rb')
require('pry-byebug')

class Gift

  attr_reader :id, :name, :description, :type, :wholesaler_id, :purchase_price, :sale_price, :quantity, :image_url

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @description = options["description"]
    @type = options["type"]
    @wholesaler_id = options["wholesaler_id"]
    @purchase_price = options["purchase_price"].to_f
    @sale_price = options["sale_price"].to_f
    @quantity = options["quantity"].to_i
    @image_url = options["image_url"]
  end

  def save
    sql = "INSERT INTO gifts
    (name, description, type, wholesaler_id, purchase_price,
      sale_price, quantity, image_url)
      VALUES
      ($1, $2, $3, $4, $5, $6, $7, $8)
      RETURNING id"
    values = [@name, @description, @type, @wholesaler_id,
    @purchase_price, @sale_price, @quantity, @image_url]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def update
    sql = "UPDATE gifts SET (name, description, type, wholesaler_id, purchase_price, sale_price, quantity, image_url) =
    ($1, $2, $3, $4, $5, $6, $7, $8) WHERE gifts.id = $9"
    values = [@name, @description, @type, @wholesaler_id,
    @purchase_price, @sale_price, @quantity, @image_url, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM gifts WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end

  def sufficient(sale_amount)
    return @quantity >= sale_amount
  end

  def sell(quantity_sold)
    @quantity -= quantity_sold if sufficient_stock(quantity_sold)
  end

  def buy(quantity_bought)
    @quantity += quantity_bought
  end

  def wholesaler
    sql = "SELECT wholesalers.* FROM wholesalers
    INNER JOIN gifts
    ON gifts.wholesaler_id = wholesalers.id
    WHERE wholesalers.id = $1"
    value = [@wholesaler_id]
    result = SqlRunner.run(sql, value)
    return Wholesaler.new(result[0])
  end

  def self.delete_all
    sql = "DELETE FROM gifts"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM gifts"
    result = SqlRunner.run(sql)
    return result.map{|gift| Gift.new(gift)}
  end

  def self.all_by_name
    sql = "SELECT * FROM gifts
    ORDER BY name ASC"
    result = SqlRunner.run(sql)
    return result.map{|gift| Gift.new(gift)}
  end

  def self.all_by_type
    sql = "SELECT * FROM gifts
    ORDER BY type ASC"
    result = SqlRunner.run(sql)
    return result.map{|gift| Gift.new(gift)}
  end

  def self.all_by_wholesaler
    sql = "SELECT gifts.* FROM gifts
    INNER JOIN wholesalers ON wholesalers.id = gifts.wholesaler_id
    ORDER BY wholesalers.name ASC"
    result = SqlRunner.run(sql)
    return result.map{|gift| Gift.new(gift)}
  end

  def self.all_by_purchase_price
    sql = "SELECT * FROM gifts
    ORDER BY purchase_price ASC"
    result = SqlRunner.run(sql)
    return result.map{|gift| Gift.new(gift)}
  end

  def self.all_by_sale_price
    sql = "SELECT * FROM gifts
    ORDER BY sale_price ASC"
    result = SqlRunner.run(sql)
    return result.map{|gift| Gift.new(gift)}
  end

  def self.all_by_quantity
    sql = "SELECT * FROM gifts
    ORDER BY quantity ASC"
    result = SqlRunner.run(sql)
    return result.map{|gift| Gift.new(gift)}
  end

  def self.find(id)
    sql = "SELECT * FROM gifts WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value)
    return Gift.new(result.first)
  end

end
