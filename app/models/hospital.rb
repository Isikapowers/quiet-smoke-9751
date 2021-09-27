class Hospital < ApplicationRecord
  has_many :doctors

  def number_of_doctors
    doctors.count
  end

  def uniq_universities
    doctors.pluck(:university).uniq
  end
end
