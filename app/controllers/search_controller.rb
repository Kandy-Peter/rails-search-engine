class SearchController < ApplicationController
  before_action :current_user

  def search
    datas ||= Search.new(permitted_params, @current_user)
    result = datas.search
    datas.save_search_activity
    if result[:error].nil?
      render json: result
    else
      render json: { error: result[:error] }
    end
  end

  private

  def permitted_params
    params.permit(:search, :user_id, :recorded_session)
  end
end