class Query < ApplicationRecord
  belongs_to :user

  validates :query, presence: true

  def update_global_count
    increment(:global_count)
  end

  def self.top_global_searches
    group('lower(query)').limit(10).order(count: :desc).count
  end

  def self.top_user_searches(user_id)
    where(user_id:).group('lower(query)').limit(5).order(count: :desc).count
  end
end
