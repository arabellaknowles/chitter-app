class Chitter < Sinatra::Base
  post '/peeps' do
    Peep.create(peep: params[:peep_text])
    flash[:notice] = 'Successfully posted'
    redirect('/')
  end
end