require 'test_helper'

class ChangeTaskStatusTest < ActionDispatch::IntegrationTest
  test 'marks all tasks as completed' do
    user = users(:john)
    login_as(user)

    visit tasks_path

    user.tasks.each do |task|
      check task.title
    end

    click_button button('tasks.update')

    assert_equal tasks_path, current_path
    assert page.has_text?(notice('tasks.batch_update'))

    assert_equal 0, all('.task.pending').count
    assert_equal 2, all('.task.completed').count
  end
end
