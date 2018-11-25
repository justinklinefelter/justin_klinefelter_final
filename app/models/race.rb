class Race < ApplicationRecord
  # Direct associations

  belongs_to :participant,
             :class_name => "User",
             :foreign_key => "user_id"

  has_many   :workouts_homepages,
             :class_name => "RacesHomepage",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
