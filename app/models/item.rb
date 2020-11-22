class Item < ApplicationRecord

 belongs_to :genre
 attachment :image
#   validates :item, inclusion: { in: [true, false] }

end
