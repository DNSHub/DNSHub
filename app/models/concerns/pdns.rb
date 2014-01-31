module PDNS
  extend ActiveSupport::Concern

  included do
    establish_connection("pdns_#{Rails.env}")
  end
end