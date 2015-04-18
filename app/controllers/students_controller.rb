class StudentsController < ApplicationController

	def new
		@student =Student.new
	end
	#添加学生
	def create
		@student = Student.new(student_params)
			if @student.save
				redirect_to @student
			else
				render 'new'
			end
	end

	#显示
	def show
		@student = Student.find(params[:id])
	end
	#显示全部
	def index
		@students = Student.all 
	end

	#修改
	def edit
		@student = Student.find(params[:id])
		
	end

	#更新操作	
	def update
		@student = Student.find(params[:id])
		# a = student_params
		# a["grade"] = a["grade"].to_i
		if @student.update_attributes(student_params)
			redirect_to @student
		else
			render 'edit'
		end
		
	end

	#删除
	def destroy
		@student = Student.find(params[:id])
		@student.destroy

		redirect_to students_path
		
	end

	private 
		def student_params
			params.require(:student).permit(:id,:name,:age,:grade_id)
		end
end
