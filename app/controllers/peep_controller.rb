class Chitter < Sinatra::Base
  post '/peeps' do
    Peep.create(peep: params[:peep_text], user_id: session[:current_user_id])
    flash[:notice] = 'Successfully posted'
    redirect('/')
  end

  get '/peeps/:id/edit' do
    @peep_text = params[:peep_text]
    @peep_id = params[:peep_id]
    erb :'/peeps/edit'
  end

  delete '/peeps/:id' do
    Peep.delete(params[:peep_id])
    redirect('/')
  end

  put '/peeps/:id' do
    Database.query("UPDATE peeps SET peep=#{params[:peep_text]} WHERE id=#{params[:peep_id]}")
    redirect('/')
  end
end