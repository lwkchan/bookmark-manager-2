require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/link'
require 'pg'
require_relative 'lib/database_connection'
require 'uri'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  DatabaseConnection.setup('bookmark_manager')

  get '/' do
    @links = Link.all
    erb(:index)
  end

  post '/add_link' do
    @new_link = params[:new_link]
    if Link.valid?(@new_link)
      Link.add_link(@new_link)
      redirect '/'
    else
      flash.now[:error] = 'Error - that is not a link.'
    end
  end

  run! if app_file == $0
end
