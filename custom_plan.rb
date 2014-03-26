require 'zeus/rails'

class CustomPlan < Zeus::Rails

  def cucumber_env
    ::Rails.env = ENV['RAILS_ENV'] = 'cucumber'
  end

  # def my_custom_command
  #  # see https://github.com/burke/zeus/blob/master/docs/ruby/modifying.md
  # end

  def spec(argv=ARGV)
    # disable autorun in case the user left it in spec_helper.rb
    RSpec::Core::Runner.disable_autorun!
    exit RSpec::Core::Runner.run(argv)
  end

end

Zeus.plan = CustomPlan.new
