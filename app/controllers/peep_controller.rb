class Chitter < Sinatra::Base
  post '/peeps' do
    Peep.create(peep: params[:peep_text], user_id: session[:current_user_id])
    flash[:notice] = 'Successfully posted'
    redirect('/')
  end
end