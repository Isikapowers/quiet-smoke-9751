class PatientsController < ApplicationController
  def index
    @patients = Patient.all.age_ordered
  end
end
