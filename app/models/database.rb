class Database
  def self.connect(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  def self.query(query)
    @connection.exec(query)
  end
end