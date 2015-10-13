class TasksController < ApplicationController
	before_action :required_logged_user

	def index
		@task = Task.new
		@tasks = current_user.tasks
	end

	def create
		@task = current_user.tasks.new(task_params)
		if @task.save
			flash.notice = t('flash.tasks.create.notice')
		else
			flash.alert = t('flash.tasks.create.alert')
		end

		redirect_to tasks_path
	end

	def edit
		@task = current_user.tasks.find(params[:id])
	end

	def update
		@task = current_user.tasks.find(params[:id])
		if @task.update(task_params)
			redirect_to tasks_path, notice: t('flash.tasks.update.notice')
		else
			render :edit
		end
	end

	def remove
		@task = current_user.tasks.find(params[:id])
	end

	def destroy
		@task = current_user.tasks.find(params[:id])
		@task.destroy!
		redirect_to tasks_path, notice: t('flash.tasks.destroy.notice')
	end

def batch_update
	current_user.tasks.where(id: params[:task_ids]).update_all(['comleted_at = coalesce(completed_at, :now)', now: Time.current])
end

	def task_params
		params
		.require(:task)
		.permit(:title)
	end
end
