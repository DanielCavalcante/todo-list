require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  test 'with valid data' do
  	visit root_path
  	click_link t('menu.signup')

    fill_in labels('user.name'), with: 'Daniel Cavalcante'
  	fill_in labels('user.emaik'), with: 'daniel@gmail.com'
  	fill_in labels('user.password'), with: 'teste'
  	fill_in labels('user.password_confirm'), with: 'teste'
  	check labels('user.tos')
  	click_button button('user.create')

  	assert_equal login_path, current_path
  	assert page.has_text?(notice('signup.create'))
  end

  test 'with invalid data' do
    visit root_path
    click_link t('menu.signup')
    click_button button('user.create')

    assert_equal '/signup', current_path
    assert page.has_text?(form_error)
  end
end
