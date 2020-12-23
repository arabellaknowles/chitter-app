describe Peep do
  before do
    @time_now = Time.now.strftime("%k:%M")
    allow(Peep).to receive(:current_time).and_return(@time_now)
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(peep: 'Hello, cruel world')
      connection = PG.connect(dbname: 'chitter_app_manager_test')
      result = connection.query("SELECT * FROM peeps WHERE id = #{peep.id};")
      persisted_data = result.first

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.peep).to eq 'Hello, cruel world'
      expect(peep.created_at).to eq @time_now
    end
  end

  describe '.all' do
    it 'returns all the peeps in reverse chronological order' do
      Peep.create(peep: "Sleepless in seatle")
      Peep.create(peep: 'Hello, cruel world')
      last_peep = Peep.create(peep: 'Goodbye, cruel world')
      
      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq last_peep.id
      expect(peeps.first.peep).to eq 'Goodbye, cruel world'
      expect(peeps.first.created_at).to eq @time_now
    end
  end
end