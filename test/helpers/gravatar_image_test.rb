require 'test_helper'

class GravatarImagetest < ActionView::TestCase
	include ApplicationHelper

	test 'render image' do
		html = Nokogiri::HTML(gravatar_image('john@example.com')).css('img').first

		assert html.matches?('img.gravatar')
	end
end
