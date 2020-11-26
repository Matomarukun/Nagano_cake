class Genre < ApplicationRecord

  has_many :items
  # def self.admin_id
  # end
  validates :name, presence: true
end
