class Chitter < Sinatra::Base
  post '/peeps' do
    Peep.create(peep: params[:peep_text], user_id: session[:current_user_id])
    flash[:notice] = 'Successfully posted'
    redirect('/')
  end

  get '/peeps/:id/edit' do
    erb :edit
  end

  delete '/peeps/:id' do
    Peep.delete(params[:peep_id])
    redirect('/')
  end
end