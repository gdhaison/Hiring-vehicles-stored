module ApplicationHelper
  def full_title page_title = ""
    base_title = t ".sub"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def status_option statuses
    statuses.map {|key, value| [key.humanize, key]}
  end
end
