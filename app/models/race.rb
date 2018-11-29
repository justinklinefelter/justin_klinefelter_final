require 'open-uri'
class Race < ApplicationRecord
  before_validation :geocode_location_id

  def geocode_location_id
    if self.location_id.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.location_id)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_id_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_id_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_id_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  belongs_to :event

  has_many   :user_races,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :user_races,
             :source => :user

  # Validations

end
