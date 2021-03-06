require 'rails_helper'

RSpec.describe Hospital do
  before :each do
    @grey = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    @meredith = @grey.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Standford University")
    @miranda = @grey.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Standford University")

    @denny = @meredith.patients.create!(name: "Denny Duquette", age: 39)
    @logan = @meredith.patients.create!(name: "Logan Mcgin", age: 15)

    @betty = @miranda.patients.create!(name: "Betty Boo", age: 71)
  end

  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe "instance methods" do
    it "can count the number of doctors in that hospital" do
      expect(@grey.number_of_doctors).to eq(2)
    end

    it "can get a unique list of universities" do
      expect(@grey.uniq_universities).to eq(["Standford University"])
    end
  end
end
