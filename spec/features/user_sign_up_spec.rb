feature 'user can sign up' do
  before do
    visit('/')
    click_on('Sign up')
  end

  scenario 'user fills in registration form and registers' do
    user_sign_up(
      username: 'javascriptFanGirl', 
      email: 'JSLover@gmail.com', 
      full_name: 'Jane Doe', 
      password: 'Dogs 4 life'
    )
    expect(page).to have_content('Successfully signed up')
    expect(page).to_not have_button('Sign up')
    expect(page).to_not have_button('Sign in')
  end

  scenario 'user fills in registration form with invalid email and receives error message' do
    user_sign_up(
      username: 'javascriptFanGirl', 
      email: 'JSLovergmail.com', 
      full_name: 'Jane Doe', 
      password: 'Dogs 4 life'
    )
    expect(page).to have_content('Invalid email, please try again')
  end

  context 'user created before tests' do 
    before do
      User.create(
        username: 'javascriptFanGirl',
        email: 'JSLover@gmail.com',
        full_name: 'Jane Doe',
        password: 'ILoveDogs'
      )
    end

    scenario 'user fills in registration form with non-unique email and receives error message' do
      user_sign_up(
        username: 'rubyGirl', 
        email: 'JSLover@gmail.com', 
        full_name: 'Joe Doe', 
        password: 'Cats 4 life'
      )
      expect(page).to have_content('Email already in use, please use another one')
    end

    scenario 'user fills in registration form with non-unique username and receives error message' do
      user_sign_up(
        username: 'javascriptFanGirl', 
        email: 'gadgetgal@gmail.com', 
        full_name: 'Josephine Doe', 
        password: 'Mice 4 life'
      )
      expect(page).to have_content('Username already in use, please use another one')
    end
  end
end