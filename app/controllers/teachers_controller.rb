class TeachersController < ApplicationController
	def new
		@teacher =Teacher.new
	end
	#添加
	def create
		@teacher = Teacher.new(teacher_params)
			if @teacher.save
				redirect_to @teacher
			else
				render 'new'
			end
	end

	#显示
	def show
		@teacher = Teacher.find(params[:id])
	end
	#显示全部
	def index
		@teachers = Teacher.all 
	end

	#修改
	def edit
		@teacher = Teacher.find(params[:id])
		
	end

	#更新操作	
	def update
		@teacher = Teacher.find(params[:id])
		# a = student_params
		# a["grade"] = a["grade"].to_i
		if @teacher.update_attributes(teacher_params)
			redirect_to @teacher
		else
			render 'edit'
		end
		
	end

	#删除
	def destroy
		@teacher = Teacher.find(params[:id])
		@teacher.destroy

		redirect_to teachers_path
		
	end

	#查看
	def che_gre
		@teacher = Teacher.find(params[:id])
		@grades = @teacher.grades
	end

	private 
		def teacher_params
			params.require(:teacher).permit(:id,:name,:grade_id)
		end
end
