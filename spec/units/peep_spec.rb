describe Peep do
  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(peep: 'Hello, cruel world')
      connection = PG.connect(dbname: 'chitter_app_manager_test')
      result = connection.query("SELECT * FROM peeps WHERE id = #{peep.id};")
      persisted_data = result.first

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.peep).to eq 'Hello, cruel world'
    end
  end

  describe '.all' do
    it 'returns all the peeps' do
      Peep.create(peep: "Sleepless in seatle")
      Peep.create(peep: 'Hello, cruel world')
      peep = Peep.create(peep: 'Goodbye, cruel world')
      
      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.peep).to eq 'Goodbye, cruel world'
    end
  end
end