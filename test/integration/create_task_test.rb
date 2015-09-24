require 'test_helper'

class CreateTaskTest < ActionDispatch::IntegrationTest
  test 'with valid data' do
      user = users(:jonh)
      login_as(user)

      visit task_path
      fill_in label('task.title'), with: 'Some task'
      click_button button('task.create')

      assert_equal task_path, current_path
      assert page.has_text?(notice('task.create'))
      assert page.has_text?('Some task')
  end
end
