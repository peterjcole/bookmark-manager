require 'sinatra/base'
require './lib/bookmark.rb'
require_relative './databaseconnection_setup.rb'

class BookmarkManager < Sinatra::Base

  enable :method_override

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

  delete '/delete' do
    Bookmark.delete(params[:id])
    redirect('/')
  end

  get '/update' do
    @id = params[:id]
    erb :update
  end

  patch '/update' do
    Bookmark.update(params[:id], title: params[:title])
    redirect('/')
  end

  run! if app_file == $0
end
