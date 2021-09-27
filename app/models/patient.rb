class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments

  def self.age_ordered
    order(age: :desc)
  end  
end
