describe User do
  before do
    @user = User.create(
      username: 'javascriptFanGirl',
      email: 'JSLover@gmail.com',
      full_name: 'Jane Doe',
      password: 'ILoveDogs'
    )
  end
  
  describe '.create' do
    it 'creates a new user' do
      connection = PG.connect(dbname: 'chitter_users_test')
      result = connection.query("SELECT * FROM users WHERE id = #{@user.id};")
      persisted_data = result.first

      expect(@user).to be_a User
      expect(@user.id).to eq persisted_data['id']
      expect(@user.username).to eq 'javascriptFanGirl'
      expect(@user.email).to eq 'JSLover@gmail.com'
      expect(@user.full_name).to eq 'Jane Doe'
    end
  end

  describe '.authenticate' do
    it 'authenticates a valid user' do
      authentication = User.authenticate(username: 'javascriptFanGirl', password: 'ILoveDogs')
      expect(authentication).to eq({"email"=>"JSLover@gmail.com", "full_name"=>"Jane Doe", "id"=>"#{@user.id}", "password"=>"#{@user.password}", "username"=>"javascriptFanGirl"})
    end
  end

  describe '.invalid_email?' do
    it 'checks the email is valid' do
      expect(User.invalid_email?('JSLover@gmail.com')).to eq(false)
      expect(User.invalid_email?('JSLover@gmailcom')).to eq(true)
      expect(User.invalid_email?('JSLovergmail.com')).to eq(true)
    end
  end

  describe '.email_in_use?' do
    it 'checks if username is already in the database' do
      expect(User.email_in_use?('JSLover@gmail.com')).to eq(true)
      expect(User.email_in_use?('RubyLover@gmail.com')).to eq(false)
    end
  end
end