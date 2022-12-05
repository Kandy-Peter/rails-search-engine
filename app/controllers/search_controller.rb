class SearchController < ApplicationController
  before_action :current_user

  def search
    result = search_service.search
    search_service.save_search_activity
    if result[:error].nil?
      render json: result
    else
      render json: { error: result[:error] }
    end
  end

  private

  def search_service
    @search_service ||= Search.new(permitted_params, @current_user)
  end

  def permitted_params
    params.permit(:search, :user_id, :recorded_session)
  end
end