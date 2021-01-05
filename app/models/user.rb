class User
  attr_reader :id, :username, :email, :full_name, :password
  include BCrypt
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def initialize(id:, username:, email:, full_name:, password:)
    @id = id
    @username = username
    @email = email
    @full_name = full_name
    @password = password
  end

  def self.create(username:, email:, full_name:, password:)
    connect_to_database
    hash_password = password_encryption(password)
    result = @connection.exec("INSERT INTO users (username, email, full_name, password) VALUES('#{username}', '#{email}', '#{full_name}', '#{hash_password}') RETURNING id, username, email, full_name, password")
    User.new(
      id: result[0]['id'],
      username: result[0]['username'], 
      email: result[0]['email'], 
      full_name: result[0]['full_name'], 
      password: result[0]['password']
    )
  end 

  def self.authenticate(username:, password:)
    connect_to_database
    user = @connection.exec("SELECT * FROM users WHERE username='#{username}'")
    db_password = Password.new(user.first['password'])
    user && (db_password == password) ? user.first : false
  end

  def self.invalid_email?(email)
    !((email =~ VALID_EMAIL_REGEX) == 0)
  end

  def self.email_in_use?(email)
    connect_to_database
    user = @connection.exec("SELECT * FROM users WHERE email='#{email}'")
    user.first ? true : false
  end

  def self.username_in_use?(username)
    connect_to_database
    user = @connection.exec("SELECT * FROM users WHERE username='#{username}'")
    user.first ? true : false
  end

  def self.username_and_email_in_use?(username:, email:)
    (username_in_use?(username) && email_in_use?(email))
  end

  private

  def self.password_encryption(password)
    hash_password = Password.create(password)
  end

  def self.connect_to_database
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_users_test')
    else
      @connection = PG.connect(dbname: 'chitter_users')
    end
  end
end