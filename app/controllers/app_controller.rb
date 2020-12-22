class Chitter < Sinatra::Base
  set :root, File.dirname(File.expand_path('..', __FILE__))
end