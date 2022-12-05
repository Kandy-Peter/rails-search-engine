class Query < ApplicationRecord
  include PgSearch::Model # include the module

  pg_search_scope :search, against: %i[query], using: :trigram

  scope :user, lambda { |user_id|
    where(user_id: user_id)
  }

  validates :query, presence: true
  validates :user_id, uniqueness: { scope: :query }
  validates :recorded_session, presence: true
end
