if ENV['ENVIRONMENT'] == 'test'
  Database.connect('chitter_app_manager_test')
else
  Database.connect('chitter_app_manager')
end
