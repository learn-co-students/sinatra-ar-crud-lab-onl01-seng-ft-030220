
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do 
    erb :new
  end
  # get '/articles' do
  #   @articles = Article.all
  #   erb :index
  # end
  
  post '/articles' do
    article = Article.create(params) #saving to database && saving to a var
    
    if article 
      redirect "/articles/#{article.id}"
    else 
      redirect '/articles/new'
    end
  end

  get '/articles' do
      @articles = Article.all
      erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params["id"])
    erb :show
  end

  post '/articles' do
    article = Article.new(params)
    if article.save
      redirect "/articles/#{article.id}"
    else
      redirect "/articles/new"
    end
  end

  get '/articles/:id/edit' do
    @article = Article.find_by_id(params[:id])
    
    erb :edit
  end

  patch '/articles/:id' do
   
    id = params["id"]
    new_params = {}
    old_article = Article.find(id)
    new_params[:title] = params["title"]
    new_params[:content] = params["content"]
    old_article.update(new_params)
    redirect "/articles/#{id}"
  end
  delete '/articles/:id' do 
    
    id = params["id"]
    
    @article = Article.find(id)
   
    @article.destroy
  
  redirect "/articles"
  end
end

