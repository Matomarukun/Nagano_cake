class Item < ApplicationRecord
  attachment :image
#   validates :item, inclusion: { in: [true, false] }
end
