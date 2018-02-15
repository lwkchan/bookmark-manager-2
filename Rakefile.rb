require './lib/database_connection.rb'

task :setup do
  p 'Setting up databases...'
  conn = PG.connect
  ['bookmark_manager','bookmark_manager_test'].each do |database|
      conn.exec("CREATE DATABASE #{database}")
      DatabaseConnection.setup("#{database}")
      DatabaseConnection.query("CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR(60));")
    end
end

task :test do
  DatabaseConnection.setup('bookmark_manager_test')
  DatabaseConnection.query("TRUNCATE links;
  INSERT INTO links (url) VALUES ('http://www.facebook.com');
  INSERT INTO links (url) VALUES ('http://www.google.com');")
end
