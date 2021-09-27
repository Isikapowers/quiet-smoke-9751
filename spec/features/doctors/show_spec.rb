require "rails_helper"

RSpec.describe "Doctors Show Page" do
  before :each do
    @grey = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    @meredith = @grey.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Standford University")
    @miranda = @grey.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Standford University")

    @denny = @meredith.patients.create!(name: "Denny Duquette", age: 39)
    @logan = @meredith.patients.create!(name: "Logan Mcgin", age: 15)

    @betty = @miranda.patients.create!(name: "Betty Boo", age: 71)

    visit doctor_path(@meredith)
  end

  describe "#User Story 1" do
    it "displays that doctor's information" do

      within("#doctor-#{@meredith.id}") do
        expect(page).to have_content(@meredith.name)
        expect(page).to have_content(@meredith.specialty)
        expect(page).to have_content(@meredith.university)
      end
    end

    it "displays the name of the hospital where this doctor works" do

      within("#doctor-#{@meredith.id}") do
        expect(page).to have_content(@meredith.hospital.name)
      end
    end

    it "displays the names of all the patients this doctor has" do

      within("#doctor-#{@meredith.id}") do
        expect(page).to have_content(@denny.name)
        expect(page).to have_content(@logan.name)

        expect(page).to have_no_content(@betty.name)
      end
    end
  end

  describe "#User Story 3--Remove a patient from a doctor" do
    it "has a button next to each patient to remove that patient from that doctor's caseload" do

      expect(page).to have_button("Remove #{@denny.name}")
      expect(page).to have_button("Remove #{@logan.name}")
    end

    it "redirects the user back to the doctor's show page after removing the patient" do

      click_on "Remove #{@denny.name}"

      expect(current_path).to eq(doctor_path(@meredith))
      
      expect(page).to have_no_content(@denny.name)
      expect(page).to have_content(@logan.name)
    end
  end
end
