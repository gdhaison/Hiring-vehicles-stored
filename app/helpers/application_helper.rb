module ApplicationHelper
  def full_title page_title = ""
    base_title = t ".sub"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def status_option statuses
    statuses.map{|key, value| [key.humanize, key]}
  end

  def check_image vehicle
    vehicle.picture? ? vehicle.picture.url : Settings.car_image
  end

  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = "success" if type == "notice"
      type = "error" if type == "alert"
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end
end
