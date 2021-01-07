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
    result = Database.query("INSERT INTO users (username, email, full_name, password) VALUES('#{username}', '#{email}', '#{full_name}', '#{password_encryption(password)}') RETURNING id, username, email, full_name, password")
    User.new(
      id: result[0]['id'],
      username: result[0]['username'], 
      email: result[0]['email'], 
      full_name: result[0]['full_name'], 
      password: result[0]['password']
    )
  end 

  def self.find_by_id(id)
    Database.query("SELECT * FROM users WHERE id='#{id}'").first
  end

  def self.authenticate(username:, password:)
    user = find_by_username(username: username)
    if user
      db_password = password_hash(user['password'])
      password_matches?(db_password: db_password, user_input_password: password) ? user : false
    else
      return false
    end
  end

  def self.invalid_email?(email)
    !((email =~ VALID_EMAIL_REGEX) == 0)
  end

  def self.email_in_use?(email)
    !!find_by_email(email: email)
  end

  def self.username_in_use?(username)
    !!find_by_username(username: username)
  end

  def self.username_and_email_in_use?(username:, email:)
    (username_in_use?(username) && email_in_use?(email))
  end

  private

  def self.password_encryption(password)
    hash_password = Password.create(password)
  end

  def self.password_hash(password)
    db_password = Password.new(password)
  end

  def self.password_matches?(db_password:, user_input_password:)
    (db_password == user_input_password)
  end

  def self.find_by_username(username:)
    (Database.query("SELECT * FROM users WHERE username='#{username}'").first)
  end

  def self.find_by_email(email:)
    (Database.query("SELECT * FROM users WHERE email='#{email}'").first)
  end
end