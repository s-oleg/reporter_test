module ApplicationHelper
  def flash_class(type)
    Constants::ALERT_TYPES[type]
  end
end
