class Article < ActiveRecord::Base
  include PgSearch::Model # include the module

  pg_search_scope :search, against: %i[title content], using: {
    tsearch: { prefix: true }
  }

  validates :title, :content, presence: true
end