module SoaRecord
  extend ActiveSupport::Concern

  included do
    validate :validate_soa_content, if: ->(record) { record.record_type?(:SOA) }
    validates :soa_content_primary, domain: true, if: ->(record) { record.record_type?(:SOA) }
    validates :soa_content_email, email: true, if: ->(record) { record.record_type?(:SOA) }
    validates :soa_content_serial, uint: true, if: ->(record) { record.record_type?(:SOA) }
    validates :soa_content_refresh, uint: true, if: ->(record) { record.record_type?(:SOA) }
    validates :soa_content_retry, uint: true, if: ->(record) { record.record_type?(:SOA) }
    validates :soa_content_expiry, uint: true, if: ->(record) { record.record_type?(:SOA) }
    validates :soa_content_nx, uint: true, if: ->(record) { record.record_type?(:SOA) }

    def soa_content_primary
      soa_content[0] if record_type? :SOA
    end

    def soa_content_email
      soa_content[1]  if record_type? :SOA
    end

    def soa_content_serial
      soa_content[2]  if record_type? :SOA
    end

    def soa_content_refresh
      soa_content[3]  if record_type? :SOA
    end

    def soa_content_retry
      soa_content[4]  if record_type? :SOA
    end

    def soa_content_expiry
      soa_content[5]  if record_type? :SOA
    end

    def soa_content_nx
      soa_content[6]  if record_type? :SOA
    end
  end

  def soa_content
    return content.split(" ") unless content.nil?
    []
  end

  def validate_soa_content
    unless soa_content.length == 7
      errors.add(:content, "isn't well formed")
    end
  end
end