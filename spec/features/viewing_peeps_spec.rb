feature 'viewing peeps' do
  scenario 'user visits homepage and sees peeps' do
    Peep.create(peep: 'Pretty nice weather IMO', user_id: 1)
    visit('/')
    expect(page).to have_content('Pretty nice weather IMO')
  end

  scenario 'user cannot see peep creation form if not signed up' do
    visit('/')
    expect(page).to_not have_content('Make a peep:')
  end

  context 'Peep created before tests' do
    before do 
      User.create(
        username: 'javascriptFanGirl',
        email: 'JSLover@gmail.com',
        full_name: 'Jane Doe',
        password: 'ILoveDogs'
      )
      allow(Peep).to receive(:current_time).and_return("17:24")  
      Peep.create(peep: 'Pretty nice weather IMO', user_id: 1)
      visit('/')
    end

    scenario 'user can view what time each peep was made' do
      expect(page).to have_content("17:24")
    end

    scenario 'user can see who posted which peep' do
      expect(page).to have_content('Jane Doe')
    end
  end
end