class Peep
  attr_reader :id, :peep, :created_at
  
  def initialize(id:, peep:, created_at:)
    @id = id
    @peep = peep
    @created_at = created_at
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_app_manager')
    end
    p self.current_time
    # only accepts strings with no apostrophes
    result = connection.exec("INSERT INTO peeps (peep, created_at) VALUES('#{peep}', '#{self.current_time}') RETURNING id, peep, created_at")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], created_at: result[0]['created_at'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_app_manager')
    end

    result = connection.exec("SELECT * FROM peeps")
    new_result = result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], created_at: peep['created_at'])
    end
    new_result.reverse
  end

  private

  def self.current_time
    Time.now.strftime("%k:%M")
  end
end