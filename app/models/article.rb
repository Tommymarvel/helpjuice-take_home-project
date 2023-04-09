class Article < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true

  def self.search_by_title(title)
    @articles = where('LOWER(title) LIKE ?', "%#{title.downcase}%")
  end
end
