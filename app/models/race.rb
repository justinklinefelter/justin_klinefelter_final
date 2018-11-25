class Race < ApplicationRecord
  # Direct associations

  has_many   :workouts_homepages,
             :class_name => "RacesHomepage",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
