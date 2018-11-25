class RacesHomepage < ApplicationRecord
  # Direct associations

  belongs_to :location

  belongs_to :user

  belongs_to :race

  # Indirect associations

  # Validations

end
