require 'test_helper'

class TaskStatusTest < ActiveSupport::TestCase
  test 'mark tasks as completed' do
    user = users(:john)
    tasks = [tasks(:pending), tasks(:completed)]
    # task_ids = tasks.map {|t| t.id }
    task_ids = tasks.map(&:id)

    TaskStatus.update(user, task_ids)

    assert_equal 2, Task.where.not(completed_at: nil).count
  end

  test 'mark tasks as pending' do
    user = users(:john)
    task_ids = []

    TaskStatus.update(user, task_ids)

    assert_equal 2, Task.where(completed_at: nil).count
  end
end
