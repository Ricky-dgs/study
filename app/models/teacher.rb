class Teacher < ActiveRecord::Base
	has_many :appointments
	has_many :grades, through: :appointments
end



