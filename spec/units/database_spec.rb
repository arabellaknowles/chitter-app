describe Database do
  describe '.connect' do
    it 'connects to the database specified in the argument' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_manager_test')

      Database.connect(dbname: 'chitter_manager_test')
    end
  end
end