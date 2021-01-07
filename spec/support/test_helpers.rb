def user_sign_in(username:, password:)
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_on 'Sign in'
end

def user_sign_up(username:, email:, full_name:, password:)
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'full_name', with: full_name
  fill_in 'password', with: password
  click_on 'Register'
end

def post_peep
  fill_in 'peep_text', with: 'Day 44 of lockdown, still no loo roll'
  click_on 'Peep' 
end