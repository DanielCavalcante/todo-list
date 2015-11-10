require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'requires title' do
    task = Task.create(title: '')
    assert task.errors[:title].any?
  end

  test 'requires user' do
    task = Task.create(user: nil)
    assert task.errors[:user].any?
  end

  test 'detects task as completed' do
    task = Task.new(completed_at: Time.current)

    assert task.completed?
    refute task.pending?
    assert_equal 'completed', task.status
  end

  test 'detects task as pending' do
    task = Task.new(completed_at: nil)

    refute task.completed?
    assert task.pending?
    assert_equal 'pending', task.status
  end

  test 'sort by pending' do
    tasks = Task.sort_by_pending.to_a

    assert_equal [tasks(:pending), tasks(:completed)], tasks
  end
end
