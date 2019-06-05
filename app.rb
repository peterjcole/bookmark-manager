require 'sinatra/base'
require './lib/bookmark.rb'
require_relative './databaseconnection_setup.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
    @list = Bookmark.all
    erb :index
  end

  get '/add' do
    erb :add
  end

  post '/add' do
    Bookmark.create(params[:url], params[:title])
    redirect('/')
  end

  post '/delete' do
    Bookmark.delete(params[:id])
    redirect('/')
  end



  run! if app_file == $0
end
