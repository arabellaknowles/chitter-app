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