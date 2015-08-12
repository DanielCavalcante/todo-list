require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test 'requires name' do
        user = User.create(name: '')
        assert user.errors[:name].any?
    end

    test 'requires e-mail' do
        user = User.create(email: '')
        assert user.errors[:email].any?
    end

    %w[
        invalid
        a@a
        a@a.a
        a..@example.org
        a..a@example.org
    ].each do |email|
        test "requires valid e-mail (#{email})" do
            user = User.create(email: email)
            assert user.errors[:email].any?
        end
    end

    test 'requires password' do
        user = User.create(password: '')
        assert user.errors[:password].any?
    end

    test 'requires password confirmation' do
        user = User.create(password: 'test', password_confirmation: 'invalid')
        assert user.errors[:password_confirmation].any?
    end

    test 'requires acceptance of terms of service' do
        user = User.create(tos: false)
        assert user.errors[:tos].any?
    end

end
