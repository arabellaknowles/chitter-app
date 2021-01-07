describe Peep do
  before do
    User.create(
      username: 'javascriptFanGirl',
      email: 'JSLover@gmail.com',
      full_name: 'Jane Doe',
      password: 'ILoveDogs'
    )
    @time_now = Time.now.strftime("%k:%M")
    allow(Peep).to receive(:current_time).and_return(@time_now)
    Peep.create(peep: 'Sleepless in seatle', user_id: 1)
    Peep.create(peep: 'Midnight madness', user_id: 1)
    @last_peep = Peep.create(peep: 'My latest peep message', user_id: 1)
  end

  describe '.create' do
    it 'creates a new peep' do
      connection = PG.connect(dbname: 'chitter_app_manager_test')
      result = connection.query("SELECT * FROM peeps WHERE id = #{@last_peep.id};")
      persisted_data = result.first

      expect(@last_peep).to be_a Peep
      expect(@last_peep.id).to eq persisted_data['id']
      expect(@last_peep.peep).to eq 'My latest peep message'
      expect(@last_peep.created_at).to eq @time_now
      expect(@last_peep.user_id).to eq '1'
    end
  end

  describe '.all' do
    it 'returns all the peeps in reverse chronological order' do
      
      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq @last_peep.id
      expect(peeps.first.peep).to eq 'My latest peep message'
      expect(peeps.first.created_at).to eq @time_now
      expect(peeps.first.user_id).to eq '1'
    end
  end

  describe '.delete' do
    it 'deletes peep from database by peep id' do
      Peep.delete(@last_peep.id)
      expect(Peep.all.length).to eq(2)
      expect(Peep.all.first.peep).to eq('Midnight madness')
    end
  end
end
