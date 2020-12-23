class Chitter < Sinatra::Base
  get '/registrations/new' do
    erb :'/registrations/new'
  end

  post '/registrations' do
    User.create(username: params[:username], email: params[:email], full_name: params[:full_name], password: password)
    flash[:notice] = 'Successfully signed up'
    redirect('/')
  end
end