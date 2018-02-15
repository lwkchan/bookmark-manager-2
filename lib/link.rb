require 'pg'
require_relative 'database_connection'

class Link

  @@list = []

  def self.list
    @@list
  end

  def self.all
    query = DatabaseConnection.query('SELECT url FROM links') # assign to variable
    query.each_row do |row|
      p row
      id = row.column_values(0).pop
      # p id
      url = row.column_values(1).pop
      # p url
      @@list << Link.new(id,url) # need @@list, and initialize method with 2 args
      # p @@list
    end
  end

  def self.add_link(link)
    DatabaseConnection.query("INSERT INTO links (url) VALUES ('#{link}')") if valid?(link)
  end

  def self.valid?(link)
    uri = URI.parse(link)
    uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
  end

  attr_reader :id, :url

  def initialize(id,url)
    @id = id
    @url = url
  end
end
