require 'test_helper'

class EditTaskTest < ActionDispatch::IntegrationTest
	test 'with valid data' do
		user = users(:john)

		login_as(user)
		visit tasks_path

		within '.tasks > .task:first-child' do
			click_link t('actions.edit')
		end

		fill_in label('task.title'), with: 'Update task'
		click_button button('task.update')

		assert_equal tasks_path, current_path
		assert page.has_text?(notice('tasks.update'))
		assert page.has_text?('Updated task')
	end

	test 'with invalid data' do
		user = users(:john)
		task = tasks(:peding)

		login_as(user)
		visit tasks_path

		within '.tasks > .task:first-child' do
			click_link t('actions.edit')
		end

		fill_in label('task.title'), with: ''
		click_button button('task.update')

		assert_equal edit_task_path, current_path
		assert page.has_text?(form_error)
	end
end
