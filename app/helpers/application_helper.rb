module ApplicationHelper
  def human_date(date)
    date.strftime("%B %d, %Y") if date
  end

  def human_datetime(datetime)
    datetime.strftime("%B %d, %Y at %I:%M %p") if datetime
  end

  def status_badge(status)
    case status
    when "scheduled" then "Scheduled"
    when "in_progress" then "In Progress"
    when "completed" then "Completed"
    when "cancelled" then "Cancelled"
    else "Unknown"
    end
  end

  def status_color(status)
    case status
    when "scheduled" then "bg-info text-dark"
    when "in_progress" then "bg-warning text-dark"
    when "completed" then "bg-success"
    when "cancelled" then "bg-danger"
    else "bg-secondary"
    end
  end
end