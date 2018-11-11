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

  def update
    sql = "UPDATE auctions SET (venue, collection_date)
    VALUES ($1, $2)"
    values = [@venue, @collection_date]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM auctions WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end

  def antiques
    sql = "SELECT antiques.* FROM antiques
    INNER JOIN auctions
    ON auctions.id = antiques.auction_id
    WHERE antiques.auction_id = $1"
    value = [@id]
    results = SqlRunner.run(sql, value)
    return results.map { |antique| Antique.new(antique) }
  end

  def self.delete_all
    sql = "DELETE FROM auctions"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM auctions"
    result = SqlRunner.run(sql)
    return result.map{|auction| Auction.new(auction)}
  end

  def self.all_by_venue
    sql = "SELECT * FROM auctions
    ORDER BY venue ASC"
    result = SqlRunner.run(sql)
    return result.map{|auction| Auction.new(auction)}
  end

  def self.all_by_date
    sql = "SELECT * FROM auctions
    ORDER BY collection_date ASC"
    result = SqlRunner.run(sql)
    return result.map{|auction| Auction.new(auction)}
  end

  def self.find(id)
    sql = "SELECT * FROM auctions WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value)
    return Auction.new(result[0])
  end

end
