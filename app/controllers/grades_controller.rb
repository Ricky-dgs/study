class GradesController < ApplicationController
	def new
		@grade = Grade.new
	end

	#显示班级
	def show
		@grade = Grade.find(params[:id])
	end
	#显示全部
	def index
		@grades = Grade.all 
	end

	#添加班级
	def create
		@grade = Grade.new(grade_params)
			if @grade.save
				redirect_to @grade
			else
				render 'new'
			end
	end

	#修改班级
	def edit
		@grade = Grade.find(params[:id])
		
	end

	#更新操作	
	def update
		@grade = Grade.find(params[:id])

		if @grade.update(grade_params)
			redirect_to @grade
		else
			render 'edit'
		end
		
	end

	#删除
	def destroy
		@grade = Grade.find(params[:id])
		@grade.destroy

		redirect_to grades_path
		
	end
	#查看学生
	def all_stu
		@grade = Grade.find(params[:id])
		@students = @grade.students

	end

	private 
		def grade_params
			params.require(:grade).permit(:id,:name)
		end
end
