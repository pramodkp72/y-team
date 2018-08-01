class PlaceComment < ApplicationRecord
  belongs_to :user
  belongs_to :place, optional: true
end
