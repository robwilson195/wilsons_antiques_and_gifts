require_relative('../db/sql_runner')

class Wholesaler

  attr_reader :id, :name, :description, :contact_number, :logo_url

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["id"]
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

  def self.delete_all
    sql = "DELETE FROM wholesalers"
    SqlRunner.run(sql)
  end

end
