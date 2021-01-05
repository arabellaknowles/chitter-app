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
end