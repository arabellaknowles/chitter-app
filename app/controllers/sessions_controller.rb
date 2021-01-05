class Chitter < Sinatra::Base
  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    current_user = User.authenticate(username: params[:username], password: params[:password])
    if current_user
      session[:current_user_id] = current_user['id']
      flash[:notice] = "Welcome, #{current_user['full_name'].split(' ').first}"
      redirect('/')
    else
      flash[:notice] = 'Sign in failed, please try again'
      redirect('/sessions/new')
    end
  end
end