class Comment < ApplicationRecord
  # Direct associations

  belongs_to :race,
             :class_name => "UserRace",
             :foreign_key => "user_race_id"

  belongs_to :commenter,
             :class_name => "User"

  # Indirect associations

  # Validations

end
