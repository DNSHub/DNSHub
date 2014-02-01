module DomainNameValidation
  extend ActiveSupport::Concern

  included do
    validates_format_of :name,
                      with: /[a-z]+\z/,
                      message: "must end with a letter",
                      on: :create
  end
end