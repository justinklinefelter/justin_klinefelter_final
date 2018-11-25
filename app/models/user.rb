class User < ApplicationRecord
  # Direct associations

  has_many   :workouts_homepages,
             :class_name => "RacesHomepage",
             :dependent => :destroy

  has_many   :races,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
