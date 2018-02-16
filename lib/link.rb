require 'pg'
require_relative 'database_connection'

class Link

  def self.all
    query = DatabaseConnection.query('SELECT * FROM links;') # assign to variable
    query.map do |row|
      Link.new(row["id"],row["url"], row["title"])
    end
  end

  def self.add_link(link, title)
    DatabaseConnection.query("INSERT INTO links (url, title) VALUES ('#{link}', '#{title}');") if valid?(link)
  end

  def self.valid?(link)
    uri = URI.parse(link)
    uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
  end

  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end
end
