class AppointmentsController < ApplicationController

	def new
		@appointment = Appointment.new
		@grades = Grade.all
		@teacher = Teacher.find(params[:teacher_id])
	end

	#添加
	def create
		p '---------------------------------------'
		
		params[:ids].each {|a| Appointment.create(teacher_id: params[:teacher_id], grade_id:a)}
		
		redirect_to teachers_path
	end

	private 
		def appointment_params
			params.require(:appointment).permit(:id,:ids)
		end

end
