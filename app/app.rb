require 'sinatra/base'
require 'pg'
require 'bcrypt'

require_relative 'models/peep.rb'
require_relative 'models/user.rb'

require_relative 'controllers/app_controller.rb'
require_relative 'controllers/home_controller.rb'
require_relative 'controllers/peep_controller.rb'
require_relative 'controllers/registrations_controller.rb'

