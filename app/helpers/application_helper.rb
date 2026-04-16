module ApplicationHelper
  def human_date(date)
    date.strftime("%B %d, %Y") if date
  end

  def human_datetime(datetime)
    datetime.strftime("%B %d, %Y at %I:%M %p") if datetime
  end

  def status_badge(status)
    case status
    when 0 then "Scheduled"
    when 1 then "In Progress"
    when 2 then "Completed"
    when 3 then "Cancelled"
    else "Unknown"
    end
  end

  # ¡NUEVO MÉTODO PARA LOS COLORES!
  def status_color(status)
    case status
    when 0 then "bg-info text-dark"      # Celeste para Programada
    when 1 then "bg-warning text-dark"   # Amarillo para En Progreso
    when 2 then "bg-success"             # Verde para Completada
    when 3 then "bg-danger"              # Rojo para Cancelada
    else "bg-secondary"                  # Gris por defecto
    end
  end
end