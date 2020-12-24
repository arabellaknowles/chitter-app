class Chitter < Sinatra::Base
  get '/registrations/new' do
    erb :'/registrations/new'
  end

  post '/registrations' do
    current_user = User.create(username: params[:username], email: params[:email], full_name: params[:full_name], password: params[:password])
    session[:current_user_id] = current_user.id
    flash[:notice] = 'Successfully signed up'
    redirect('/')
  end
end