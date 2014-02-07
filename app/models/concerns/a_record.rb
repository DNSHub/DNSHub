module ARecord
  extend ActiveSupport::Concern

  included do
    validates :content, ip_v4: true, if: ->(record) { record.record_type?(:A) }
  end
end