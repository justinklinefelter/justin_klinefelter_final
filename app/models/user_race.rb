class UserRace < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :race

  # Indirect associations

  # Validations

end
