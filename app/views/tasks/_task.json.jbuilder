json.extract! task, :id, :title, :deadline, :completed, :context, :priority_id, :status_id, :category_id, :label_id, :goal_id, :created_at, :updated_at
json.url task_url(task, format: :json)
