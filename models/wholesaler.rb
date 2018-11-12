require_relative('../db/sql_runner')

class Wholesaler

  attr_reader :id, :name
  attr_accessor :description, :contact_number, :logo_url

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @description = options["description"]
    @contact_number = options["contact_number"].to_i
    @logo_url = options["logo_url"]
  end

  def save
    sql = "INSERT INTO wholesalers (name, description, contact_number, logo_url)
    VALUES ($1, $2, $3, $4)
    RETURNING id"
    values = [@name, @description, @contact_number, @logo_url]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def update
    sql = "UPDATE wholesalers SET (name, description, contact_number, logo_url) = ($1, $2, $3, $4)
    WHERE wholesalers.id = $5"
    values = [@name, @description, @contact_number, @logo_url, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM wholesalers WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end

  def gifts
    sql = "SELECT gifts.* FROM gifts
    INNER JOIN wholesalers
    ON wholesalers.id = gifts.wholesaler_id
    WHERE gifts.wholesaler_id = $1"
    value = [@id]
    results = SqlRunner.run(sql, value)
    return results.map { |gift| Gift.new(gift) }
  end

  def self.delete_all
    sql = "DELETE FROM wholesalers"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM wholesalers"
    result = SqlRunner.run(sql)
    return result.map{|wholesaler| Wholesaler.new(wholesaler)}
  end

  def self.all_by_name
    sql = "SELECT * FROM Wholesalers
    ORDER BY name ASC"
    result = SqlRunner.run(sql)
    return result.map{|wholesaler| Wholesaler.new(wholesaler)}
  end

  def self.find(id)
    sql = "SELECT * FROM wholesalers WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value)
    return Wholesaler.new(result.first)
  end

end
