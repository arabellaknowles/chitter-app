class Chitter < Sinatra::Base
  get '/registrations/new' do
    erb :'/registrations/new'
  end

  post '/registrations' do
    if User.invalid_email?(params[:email]) 
      flash[:notice] = 'Invalid email, please try again'
      redirect('/registrations/new')
    elsif User.email_in_use?(params[:email])
      flash[:notice] = 'Email already in use, please use another one'
      redirect('/registrations/new')
    elsif User.username_in_use?(params[:username])
      flash[:notice] = 'Username already in use, please use another one'
      redirect('/registrations/new')
    else
      current_user = User.create(username: params[:username], email: params[:email], full_name: params[:full_name], password: params[:password])
      session[:current_user_id] = current_user.id
      flash[:notice] = 'Successfully signed up'
      redirect('/')
    end
  end
end