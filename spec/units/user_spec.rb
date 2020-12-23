describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(
        username: 'javascriptFanGirl',
        email: 'JSLover@gmail.com',
        full_name: 'Jane Doe',
        password: 'ILoveDogs'
      )

      connection = PG.connect(dbname: 'chitter_users_test')
      result = connection.query("SELECT * FROM users WHERE id = #{user.id};")
      persisted_data = result.first

      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.username).to eq 'javascriptFanGirl'
      expect(user.email).to eq 'JSLover@gmail.com'
      expect(user.full_name).to eq 'Jane Doe'
    end
  end
end