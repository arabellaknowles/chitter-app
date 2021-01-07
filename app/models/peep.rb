class Peep
  attr_reader :id, :peep, :created_at, :user_id
  
  def initialize(id:, peep:, created_at:, user_id:)
    @id = id
    @peep = peep
    @created_at = created_at
    @user_id = user_id
  end

  def self.create(peep:, user_id:)
    connect_to_database
    # only accepts strings with no apostrophes
    result = @connection.exec("INSERT INTO peeps (peep, created_at, user_id) VALUES('#{peep}', '#{current_time}', '#{user_id}') RETURNING id, peep, created_at, user_id")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], created_at: result[0]['created_at'], user_id: result[0]['user_id'])
  end

  def self.all
    connect_to_database
    result = @connection.exec("SELECT * FROM peeps")
    peeps = result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], created_at: peep['created_at'], user_id: peep['user_id'])
    end
    
    peeps.reverse
  end

  def self.delete(peep_id)
    connect_to_database
    @connection.exec("DELETE FROM peeps WHERE id=#{peep_id}")
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