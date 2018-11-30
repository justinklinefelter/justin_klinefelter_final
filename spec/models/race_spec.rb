require 'rails_helper'

RSpec.describe Race, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:event) }

    it { should have_many(:user_races) }

    end

    describe "InDirect Associations" do

    it { should have_many(:users) }

    end

    describe "Validations" do
      
    end
end
