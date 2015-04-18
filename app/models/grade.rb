class Grade < ActiveRecord::Base
	has_many :appointments
	has_many :teachers, through: :appointments
	has_many :students
	validates :name, presence: true,
					length: { minimum: 5 }
end
