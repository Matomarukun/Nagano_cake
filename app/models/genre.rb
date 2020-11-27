class Genre < ApplicationRecord

  has_many :items
  # def self.admin_id
  # end
  validates :name, presence: true
  validates :is_active, inclusion: { in: [true, false] }

end
