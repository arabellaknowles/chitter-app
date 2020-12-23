class Peep
  attr_reader :id, :peep, :created_at
  
  def initialize(id:, peep:, created_at:)
    @id = id
    @peep = peep
    @created_at = created_at
  end

  def self.create(peep:)
    connect_to_database
    # only accepts strings with no apostrophes
    result = @connection.exec("INSERT INTO peeps (peep, created_at) VALUES('#{peep}', '#{current_time}') RETURNING id, peep, created_at")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], created_at: result[0]['created_at'])
  end

  def self.all
    connect_to_database
    result = @connection.exec("SELECT * FROM peeps")
    peeps = result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], created_at: peep['created_at'])
    end
    
    peeps.reverse
  end

  private

  def self.connect_to_database
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_app_manager_test')
    else
      @connection = PG.connect(dbname: 'chitter_app_manager')
    end
  end

  def self.current_time
    Time.now.strftime("%k:%M")
  end
end