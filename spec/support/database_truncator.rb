def truncate_test_database
  p "Setting up test database..."
  connection = PG.connect(dbname: 'chitter_app_manager_test')
  connection.exec("TRUNCATE users, peeps RESTART IDENTITY;")
end