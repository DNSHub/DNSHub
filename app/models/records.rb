class Records < ActiveRecord::Base
  include PDNS
  include DomainNameValidation

  belongs_to :domain
end
