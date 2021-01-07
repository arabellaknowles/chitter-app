class Peep
  attr_reader :id, :peep, :created_at, :user_id
  
  def initialize(id:, peep:, created_at:, user_id:)
    @id = id
    @peep = peep
    @created_at = created_at
    @user_id = user_id
  end

  def self.create(peep:, user_id:)
    # only accepts strings with no apostrophes
    result = Database.query("INSERT INTO peeps (peep, created_at, user_id) VALUES('#{peep}', '#{current_time}', '#{user_id}') RETURNING id, peep, created_at, user_id")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], created_at: result[0]['created_at'], user_id: result[0]['user_id'])
  end

  def self.all
    result = Database.query("SELECT * FROM peeps")
    peeps = result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], created_at: peep['created_at'], user_id: peep['user_id'])
    end
    
    peeps.reverse
  end

  def self.delete(peep_id)
    Database.query("DELETE FROM peeps WHERE id=#{peep_id}")
  end

  private

  def self.current_time
    Time.now.strftime("%k:%M")
  end
end