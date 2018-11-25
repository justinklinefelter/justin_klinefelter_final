require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:workouts_homepages) }

    it { should have_many(:races) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
