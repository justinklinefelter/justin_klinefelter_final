class UserRace < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  belongs_to :user

  belongs_to :race

  # Indirect associations

  # Validations

end
