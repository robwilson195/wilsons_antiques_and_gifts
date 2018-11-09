require_relative('../db/sql_runner')

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
    @id = result[0]["id"]
  end

  def update
    sql = "UPDATE gifts SET (name, description, type, wholesaler_id, purchase_price, sale_price, quantity, image_url)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8)"
    values = [@name, @description, @type, @wholesaler_id,
    @purchase_price, @sale_price, @quantity, @image_url]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM gifts WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end

  def sell(quantity_sold)
    @quantity -= quantity_sold
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

  def self.find(id)
    sql = "SELECT * FROM antiques WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value)
    return Gift.new(result.first)
  end

end
