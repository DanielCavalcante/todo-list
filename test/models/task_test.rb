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
end
