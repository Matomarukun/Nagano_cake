class Item < ApplicationRecord


 attachment :image
 belongs_to :genre
 has_many :cart_items
 has_many :oder_items


 # validates :is_active, inclusion: {in: [true, false]}
 validates :name, :price, :introduction, presence: true
 validates :price, numericality: true
# validates :is_active, inclusion: { in: %w(draft publish private) }

end
