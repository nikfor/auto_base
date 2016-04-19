class Car < ActiveRecord::Base
  validates :car_passport, :date_of_issue_passport, presence: true
  has_many :pictures
  accepts_nested_attributes_for :pictures, allow_destroy: true
end
