require 'rest-client'

puts 'Get artciles form API'

def api_key
  ENV['API_KEY']
end

def articles_dataset
  api_data = { key: api_key }
  articles = RestClient.get("https://newsapi.org/v2/everything?q=Apple&from=2022-12-05&sortBy=popularity&apiKey=#{api_data[:key]}")
  datas = JSON.parse(articles.body)
  datas['articles'].each do |a|
    Article.create(
      title: a['title'],
      content: a['description'],
    )
  end
end

articles_dataset()
puts 'Articles created'

