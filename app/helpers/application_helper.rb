module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | BetterServed"      
    end
  end
end
