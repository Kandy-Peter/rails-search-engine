# RAILS REALTIME SEARHC ENGINE

## Description

The rails realtime search engine is a simple search engine that allows you to search for a specific term in a specific model from Atricles, post , etc. It uses the [pgSearch gem] to search for the term in the database and returns the results in a realtime and save all queries in segment for only the current user.

## Lve Demo

[Live Demo Link](https://rails-realtime-search-engine.herokuapp.com/)
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chartkick'
gem 'pg_search'
```

And then execute:

    $ bundle install

Or install it yourself as:
  
      $ gem install pg_search
      etc...

## Start command

    $ rails db:create
    $ rails db:migrate
    $ rails db:seed
    $ rails s

## Prerequisites

    $ rails > 7
    $ ruby > 3.0.0
    $ postgresql > 13.3

## Usage
 to laod the articles from newsapi.org you need a `.env` file with:
```ruby
API_KEY=your_api_key
```
then run the command:
```rails db:seed```
## Author

👤 **Kandy Peter Kamuntu**

- Github: [@kandy-Peter]()
- Twitter: [@kandy_peter](https://twitter.com/kandy_99)
- Linkedin: [Kandy Peter Kamuntu](https://www.linkedin.com/in/kandy-peter-kamuntu-5b1b1b1b1/)


 



