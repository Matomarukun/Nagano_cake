class Item < ApplicationRecord

 attachment :image
 # belongs_to :genre
 has_many :cart_items
 has_many :oder_itemd

#   validates :item, inclusion: { in: [true, false] }
validates :name, :price,  presence: true
validates :is_active, inclusion: { in: %w(draft publish private) }

end
