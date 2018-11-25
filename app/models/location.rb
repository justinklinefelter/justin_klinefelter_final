class Location < ApplicationRecord
  # Direct associations

  has_many   :workouts_homepages,
             :class_name => "RacesHomepage",
             :dependent => :destroy

  has_many   :races,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
