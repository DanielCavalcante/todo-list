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

    def task_params
        params
            .require(:task)
            .permit(:title)
    end
 end
