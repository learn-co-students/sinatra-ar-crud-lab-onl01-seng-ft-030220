require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do

    erb :'articles/new'
  end

  post '/articles' do
    @article = Article.create(params[:article])
    @article.save
    @article
    redirect "/articles/#{@article.id}"
  end

  get '/articles' do
    # params[:article].each_with_index do |details|
    #   Article.new(details)
    # end
    @articles = Article.all

    erb :'articles/index' 
  end

  get '/articles/:id' do
    @article = Article.find(params[:id]) 
    
    erb :'articles/show'
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id]) 

      erb :'articles/edit'
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id]) 
    @article.update(params[:article])

    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id]) 
    @article.destroy

    redirect "articles/index"
  end

end
