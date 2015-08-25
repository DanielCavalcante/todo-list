require 'capybara/rails'

class ActionDispatch::IntegrationTest
	include Capybara::DSL

	setup do
        Capybara.reset_sessions!
    end
end
