describe Database do
  describe '.connect' do
    it 'connects to the database specified in the argument' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_app_manager_test')

      Database.connect('chitter_app_manager_test')
    end
  end

  describe '.query' do
    it 'queries database with specified psql string argument' do
      connection = Database.connect('chitter_app_manager_test')
      expect(connection).to receive(:exec).with("SELECT * FROM users WHERE id='1'")

      Database.query("SELECT * FROM users WHERE id='1'")
    end
  end
end