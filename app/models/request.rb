class Request < ActiveRecord::Base
  include ActionView::Helpers::TranslationHelper
  belongs_to :item
  after_create :push_msg

  def push_msg
    message
    Pusher["private_#{item.place.uuid}_notifications"].trigger('action', {message: message})
    #Pusher[PUSHER_REQUEST_CHANNEL].trigger('new_request', {:message => msg})
  end

  def message
    msg = better_served_header
    msg << font_big(t(type))
    msg << font_normal(item.name)
    msg << created_at.strftime("%H:%M")
    msg << partial_cut
  end


  def font_big(text)
    t = "\e!\x38" + text + "\n\n"
    t + font_normal
  end

  def partial_cut
    "\n\n\n\n\n\n\n\n\x1d\x561\x0c"
  end

  def font_normal(text = nil)
    s = "\e!\x00"
    s << text + "\n" if text
    s
  end

  def font_small(text)
    "\e!\x01" + text + "\n"
  end

  def align_center(text)
    "\e!\x01" + text + "\n"
  end

  def set_center
    "\e!\x01"
  end

  def set_left
    "\e!\x00"
  end

  def better_served_header
    s = set_center
    s << "-------------  "
    s << ENV['APP_NAME']
    s << "  -------------  "
    s << "\n\n"
    s << set_left
    s
  end

end
