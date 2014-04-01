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

  def hr_double
    haml_tag "div.hr.hr-18.hr-double.dotted"
  end

  def wizard(title, &block)
    capture_haml do
      haml_tag ".widget-box" do
        haml_tag "div.widget-header.widget-header-blue.widget-header-flat" do
          haml_tag "h4" do
            haml_concat title
          end
        end
        haml_tag ".widget-body" do
          haml_tag ".widget-main" do
            yield
          end
        end
      end
    end
  end

  def table(&block)
    haml_tag "table.table.table-striped.table-bordered.table-hover" do
      yield
    end
  end

  def ace_thumbnail(&block)
    capture_haml do
      haml_tag "ul.ace-thumbnails" do
        haml_tag :li do
          yield
        end
      end

    end
  end


end
