require_relative('../db/sql_runner')

class Auction

  attr_reader :id, :venue, :collection_date

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @venue = options["venue"]
    @collection_date = options["collection_date"]
  end

  def save
    sql = "INSERT INTO auctions (venue, collection_date)
    VALUES ($1, $2)
    RETURNING id"
    values = [@venue, @collection_date]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.delete_all
    sql = "DELETE FROM auctions"
    SqlRunner.run(sql)
  end

end
