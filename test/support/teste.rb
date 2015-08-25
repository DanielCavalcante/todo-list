class ActiveSupport::TestCase
    def t(*args)
        I18n.t(*args)
    end
end

class ActionDispatch::IntegrationTest

    def label(scope)
        t(scope, scope: 'labels')
    end

    def button(scope)
        t(scope, scope: 'helpers.submit')
    end

    def notice(scope)
        t("flash.#{scope}.notice")
    end

    def alert(scope)
        t("flash.#{scope}.alert")
    end

    def form_error
        t('form.error_message')
    end

    def login_as(user)
        visit root_path
        click_link t('menu.login')

        fill_in label('login.email'), with: user.email
        fill_in label('login.password'), with: 'test'
        click_button button('login')
    end
end
