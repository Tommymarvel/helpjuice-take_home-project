class User < ApplicationRecord
  has_many :queries, dependent: :destroy

  validates :name, presence: true
end
