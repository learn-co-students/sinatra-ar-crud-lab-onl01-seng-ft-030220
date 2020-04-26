
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @articles = Article.all

    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.new(params)
    
    if @article.save
      redirect "/articles/#{@article.id}"
    else
      redirect "/articles/new"
    end
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :show
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    params.delete("_method")

    if @article.update(params)
      redirect "/articles/#{@article.id}"
    else
      redirect "/articles/#{@article.id}/edit"
    end
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])

    erb :edit
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])

    @article.destroy

    redirect '/articles'
  end
end
