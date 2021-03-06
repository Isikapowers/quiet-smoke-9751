require "rails_helper"

RSpec.describe Patient do
  before :each do
    @grey = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    @meredith = @grey.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Standford University")
    @miranda = @grey.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Standford University")

    @denny = @meredith.patients.create!(name: "Denny Duquette", age: 39)
    @logan = @meredith.patients.create!(name: "Logan Mcgin", age: 15)

    @betty = @miranda.patients.create!(name: "Betty Boo", age: 71)
  end
  
  describe "relationships" do
    it { should have_many(:appointments) }
    it { should have_many(:doctors).through(:appointments) }
  end

  describe "class methods" do
    it "can order patients by age from oldest to youngest" do
      expect(Patient.age_ordered.first).to eq(@betty)
      expect(Patient.age_ordered.second).to eq(@denny)
      expect(Patient.age_ordered.last).to eq(@logan)
    end
  end
end
