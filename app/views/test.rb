# get '/articles/:id/edit' do 
  #   @article = Article.find(params["id"])
  #   erb :edit
  # end

  
 # patch '/articles/:id' do
  #   article = Article.find_by_id(params[:id])
  #   params.delete("_method")
  #   if article.update(params)
  #     redirect "/articles/#{article.id}"
  #   else
  #     redirect "/articles/#{article.id}/edit"
  #   end
  # end