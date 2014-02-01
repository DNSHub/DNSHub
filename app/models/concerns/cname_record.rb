module CnameRecord
  extend ActiveSupport::Concern

  included do
    validates :content, domain: true, if: ->(record) { record.record_type?(:CNAME) }
  end
end