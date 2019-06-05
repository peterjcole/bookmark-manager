require 'sinatra/base'
require './lib/bookmark.rb'
require_relative './databaseconnection_setup.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
    @list = Bookmark.all
    erb :index
  end

  run! if app_file == $0
end
