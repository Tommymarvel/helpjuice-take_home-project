class Article < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    %w[title body]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def self.ransackable_scopes(auth_object = nil)
    []
  end

  def self.ransortable_attributes(auth_object = nil)
    %w[title body]
  end
end
