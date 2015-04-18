class Student < ActiveRecord::Base
  belongs_to :grade
  validates :name,presence: true,
					length: { minimum: 5 }				
end
