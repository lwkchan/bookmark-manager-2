require 'pg'
require_relative 'database_connection'

class Link
  def self.all
    DatabaseConnection.query('SELECT url FROM links')
  end

  def self.add_link(link)
    DatabaseConnection.query("INSERT INTO links (url) VALUES ('#{link}')") if valid?(link)
  end

  def self.valid?(link)
    uri = URI.parse(link)
    uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
  end
end

