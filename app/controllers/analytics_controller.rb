class AnalyticsController < ApplicationController
  before_action :current_user

  def index
    @queries = Query.where(user_id: @current_user).order(:counter)
    @total_searches = @queries.reduce(0) { |sum, query| sum + query.counter }
    @successfull_searches = @queries.select(&:found?)
    @unsuccessfull_searches = @queries.reject(&:found)
    @total_articles = Article.count

    puts 'search results' + @queries.to_s
  end
end
