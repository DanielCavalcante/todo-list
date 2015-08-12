require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  test 'with valid data' do
  	visit '/'
  	click_link 'Cadastre-se'

    fill_in 'Seu nome', with: 'Daniel Cavalcante'
  	fill_in 'Seu e-mail', with: 'daniel@gmail.com'
  	fill_in 'Sua senha', with: 'teste'
  	fill_in 'Confirme sua senha', with: 'teste'
  	check 'Concordo com os termos de serviço'
  	click_button 'Criar minha conta'

  	assert_equal '/login', current_path
  	assert page.has_text?('Cadastro realizado com sucesso!')
  end

  test 'with invalid data' do
    visit '/'
    click_link 'Cadastre-se'
    click_button 'Criar minha conta'

    assert_equal '/signup', current_path
    assert page.has_text?('Verifique o formulário antes de continuar')
  end
end
