module PDNS
  extend ActiveSupport::Concern

  included do
    self.inheritance_column = 'rails_type_column'

    establish_connection("pdns_#{Rails.env}")
  end
end