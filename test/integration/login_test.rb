require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test 'with valid credentials' do

      user = users(:john)

      visit root_path
      click_link t('menu.login')

      fill_in label('login.email'). with: user.email
      fill_in label('login.password'). with: 'test'
      click_button button('login')

      assert_equal tasks_path, current_path
      assert page.has_text?(user.name)
  end
end
