class Car < ActiveRecord::Base
  validates :car_passport, :date_of_issue_passport, presence: true

end
