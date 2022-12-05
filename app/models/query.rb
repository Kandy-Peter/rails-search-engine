class Query < ActiveRecord::Base
  include PgSearch::Model # include the module

  pg_search_scope :search, against: %i[query], using: :trigram

  scope :user = ->(user_id) { where(user_id: user_id) }

  validates :query, presence: true
  validates :user_id, uniqueness: { scope: :query }
end
