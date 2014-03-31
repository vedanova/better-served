module AlertHelper

  def info_alert(opts = {}, &block)
    haml_tag('div.alert.alert-info') do
      yield
    end
  end


end