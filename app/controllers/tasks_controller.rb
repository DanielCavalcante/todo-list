 class TasksController < ApplicationController
    before_action :required_logged_user

    def index
        @task = Task.new
    end
 end
