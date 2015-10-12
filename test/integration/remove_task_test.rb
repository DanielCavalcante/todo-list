require 'test_helper'

class RemoveTaskTest < ActionDispatch::IntegrationTest
  test 'removes task' do
  	user = users(:john)
		login_as(user)

		visit tasks_path
		within '.tasks > .task:first-child' do
			click_link t('actions.remove')
		end

		click_button button('task.remove')

		assert_equal tasks_path, current_path
		assert page.has_text?(notice('tasks.destroy'))
		assert_equal 1, all('.task').size
  end
end
