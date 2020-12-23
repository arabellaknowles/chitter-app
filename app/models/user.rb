class User
  attr_reader :id, :username, :email, :full_name

  def initialize(id:, username:, email:, full_name:, password:)
    @id = id
    @username = username
    @email = email
    @full_name = full_name
    @password = password
  end

  def self.create(username:, email:, full_name:, password:)
    connect_to_database
    result = @connection.exec("INSERT INTO users (username, email, full_name, password) VALUES('#{username}', '#{email}', '#{full_name}', '#{password}') RETURNING id, username, email, full_name, password")
    User.new(
      id: result[0]['id'],
      username: result[0]['username'], 
      email: result[0]['email'], 
      full_name: result[0]['full_name'], 
      password: result[0]['password']
    )
  end 

  private

  def self.connect_to_database
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_users_test')
    else
      @connection = PG.connect(dbname: 'chitter_users')
    end
  end
end