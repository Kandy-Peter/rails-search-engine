class Search
  def initialize(data, address_ip)
    @query= data[:search].gsub(/[^0-9A-Za-z]/, '')
    @user_id= address_ip
    @recorded_session = data[:recorded_session]
  end

  def search
    @results = Article.search(@query).limit(10)
    if @results.blank?
      { error: 'No results found' }
    else
      { data: @results, error: nil }
    end
  end

  def save_search_activity
    puts 'New query created-----------------'
    @query_record = Query.find_by(recorded_session: @recorded_session)
    @query_increment = Query.find_by(user_id: @user_id, query: @query)
    @founded_query = Query.search(@query).user(@user_id).where(recorded_session: @recorded_session)

    @query_increment.nil? ? create_new_query : query_increment

    decrement_query_counter if !part_of_session? && !@query_record.nil?

    @founded_query.each do |query|
      query.delete if included_and_shorter(query.query)
    end
    puts 'New query created-----------------'
  end

  private

  def included_and_shorter(query)
    @query.include?(query) && query.length < @query.length
  end

  def part_of_session?
    @query_record.counter == 1 unless @query_record.nil?
  end
  
  def new_query?
    !@query_record.nil? && @query.include?(@query_record.query)
  end
  
  def create_new_query
    @new_query = Query.create!(user_id: @user_id, recorded_session: @recorded_session, found: !@results.blank?, query: @query)
  end

  def query_increment
    @query_increment.update(recorded_session: @recorded_session, counter: @query_increment.counter + 1)
  end

  def decrement_query_counter
    @query_record.update(counter: @query_record.counter - 1, recorded_session: 0)
  end
end