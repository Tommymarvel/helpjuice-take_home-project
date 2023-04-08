class Article < ApplicationRecord
  before_save :increment_search_count

  def increment_search_count
    search_count = SearchCount.find_or_initialize_by(query: title_or_body_cont)
    search_count.count += 1
    search_count.save
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[title body]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end

  def self.ransackable_scopes(_auth_object = nil)
    []
  end

  def self.ransortable_attributes(_auth_object = nil)
    %w[title body]
  end
end
