require_relative('../db/sql_runner')

class Gift

  attr_reader :id, :name, :description, :type, :wholesaler_id, :purchase_price, :sale_price, :qunatity, :image_url

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

  def self.delete_all
    sql = "DELETE FROM gifts"
    SqlRunner.run(sql)
  end

end
