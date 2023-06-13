class HomeController < ApplicationController
  def index
    @tasks = current_user.tasks.not_completed.order(priority_id: :desc)
    @count_low = count_tasks(Task.priorities[:low])
    @count_medium = count_tasks(Task.priorities[:medium])
    @count_high = count_tasks(Task.priorities[:high])
    @colors = { low: "teal", medium: "orange", high: "red" }
  end

  private
  def count_tasks (priority)
    current_user.tasks.not_completed_with_priority(priority).count
  end
end
