require_relative('../db/sql_runner')

class Antique

  attr_reader :name, :description, :type, :auction_id, :purchase_price, :sale_price, :image_url

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @description = options["description"]
    @type = options["type"]
    @auction_id = options["auction_id"].to_i
    @purchase_price = options["purchase_price"].to_f
    @sale_price = options["sale_price"].to_f
    @image_url = options["image_url"]
  end

  def save
    sql = "INSERT INTO antiques
    (name, description, type, auction_id, purchase_price,
      sale_price, image_url)
      VALUES
      ($1, $2, $3, $4, $5, $6, $7)
      RETURNING id"
    values = [@name, @description, @type, @auction_id,
    @purchase_price, @sale_price, @image_url]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"]
  end

  def update
    sql = "UPDATE antiques SET (name, description, type, auction_id, purchase_price, sale_price, image_url)
    VALUES ($1, $2, $3, $4, $5, $6, $7)"
    values = [@name, @description, @type, @auction_id,
    @purchase_price, @sale_price, @image_url]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM antiques WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end

  def self.delete_all
    sql = "DELETE FROM antiques"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM antiques"
    result = SqlRunner.run(sql)
    return result.map{|antique| Antique.new(antique)}
  end

  def self.find(id)
    sql = "SELECT * FROM antiques WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value)
    return Antique.new(result.first)
  end

end