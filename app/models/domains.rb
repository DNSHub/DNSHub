class Domains < ActiveRecord::Base
  include PDNS
  include DomainNameValidation

  has_many :records
end
