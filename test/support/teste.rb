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

    def form_error
        t('form.error_message')
    end
end
