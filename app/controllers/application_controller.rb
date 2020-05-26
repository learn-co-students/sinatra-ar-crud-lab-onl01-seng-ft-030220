require_relative '../../config/environment'

class ArticlesController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    
  end
  
  get '/articles/new' do
    erb :new
  end
  
  post 'articles' do
    @articles = Articles.create(params)
    redirect to "/articles/#{articles.id}"
  end
  
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  get 'articles/:id' do
    @articles = Article.find_(params[:id])
    erb :show
  end
  
  get '/articles/:id/edit' do
    @articles = Article.find(params[:id])
    erb :edit
  
  patch "/articles/:id" do
    @articles = Article.find(params[:id])
    params.delete("_method")
    if @articles.update(params)
      redirect to "/articles/#{@articles.id}"
    else redirect to "/articles/#{articles.id}/edit"
    end
  end
  
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end
end
