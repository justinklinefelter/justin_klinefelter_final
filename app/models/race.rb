class Race < ApplicationRecord
  # Direct associations

  belongs_to :city,
             :class_name => "Location",
             :foreign_key => "location_id",
             :counter_cache => true

  belongs_to :participant,
             :class_name => "User",
             :foreign_key => "user_id"

  has_many   :workouts_homepages,
             :class_name => "RacesHomepage",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
