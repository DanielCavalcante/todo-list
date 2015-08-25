require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test 'with valid credentials' do

      user = users(:daniel)

      login_as(user)

      assert_equal tasks_path, current_path
      assert page.has_text?(user.name)
  end

  test 'with invalid credentials' do
      visit root_path
      click_link t('menu.login')
      click_button button('login')

      assert_equal login_path, current_path
      assert page.has_text?(alert('login.create'))

      visit tasks_path

      assert_equal login_path, current_path
      assert page.has_text?(alert('login.required'))
  end

  test 'when loggin out' do
      user = users(:daniel)

      login_as(user)

      visit tasks_path
      click_on t('menu.logout')

      assert_equal login_path, current_path

      visit tasks_path
      assert_equal login_path, current_path
  end

end
