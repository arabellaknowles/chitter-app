require 'sinatra'

class Chitter < Sinatra::Base
  get '/' do
    'Chitter'
  end
end