require 'sinatra/flash'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  set :root, File.dirname(File.expand_path('..', __FILE__))
  enable :sessions
end