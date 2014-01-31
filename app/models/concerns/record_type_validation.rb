include ValidationHelper

module RecordTypeValidation
  extend ActiveSupport::Concern

  included do
    validate :validate_a_content, if: ->(record) { record.record_type?(:A) }
    validate :validate_cname_content, if: ->(record) { record.record_type?(:CNAME) }
    validate :validate_soa_content, if: ->(record) { record.record_type?(:SOA) }
  end

  def validate_a_content
    unless ValidationHelper::ipV4? content
      errors.add(:content, "isn't a valid ip v4 address.")
    end
  end

  def validate_cname_content
    unless ValidationHelper::domain? content
      errors.add(:content, "isn't a domain.")
    end
  end

  def validate_soa_content
    value_array = []
    value_array = content.split(" ") unless content.nil?

    unless value_array.length == 7
      errors.add(:content, "isn't well formed")
    end

    unless ValidationHelper::domain? value_array[0]
      errors.add(:content, "started not with a domain")
    end

    unless ValidationHelper::email? value_array[1]
      errors.add(:content, "second value must be an email")
    end

    unless value_array[2, 6].to_a.all? { |v| ValidationHelper::uint? v }
      errors.add(:content, "last five values must be uints")
    end
  end
end