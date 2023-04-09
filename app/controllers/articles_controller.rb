class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @top_global_searches = Query.top_global_searches
    @top_user_searches = Query.top_user_searches(@current_user&.id)
  end
end
