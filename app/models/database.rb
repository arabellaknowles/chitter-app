class Database
  def self.connect(dbname:)
    PG.connect(dbname: dbname)
  end
end