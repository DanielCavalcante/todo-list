class User < ActiveRecord::Base
    has_secure_password
    attr_accessor :tos

    has_many :tasks

    validates_presence_of :name
    validates_format_of :email, with: EMAIL_FORMAT
    validates_acceptance_of :tos, on: :create
end
