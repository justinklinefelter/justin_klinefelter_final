require 'rails_helper'

RSpec.describe Race, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:participant) }

    it { should have_many(:workouts_homepages) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
