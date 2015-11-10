class TaskStatus
  def self.update(user, task_ids)
    Task.transaction do
      mark_as_completed(user, task_ids)
      mark_as_pending(user, task_ids)
    end
  end

  private

  def self.mark_as_completed(user, task_ids)
    user.tasks.where(id: task_ids)
      .update_all(['completed_at = coalesce(completed_at, :now)', now: Time.current])
  end

  def self.mark_as_pending(user, task_ids)
    user.tasks.where.not(id: task_ids)
      .update_all(completed_at: nil)
  end
end
