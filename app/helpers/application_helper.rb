module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value}"
    end
  end

  def h4(text)
    haml_tag "h4.green.smaller" do
      haml_concat text
    end
  end

end
