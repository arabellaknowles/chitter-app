class Chitter < Sinatra::Base
  get '/registrations/new' do
    erb :'/registrations/new'
  end
end