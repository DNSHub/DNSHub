class IpV4Validator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([0-9]+\.){3}[0-9]+\z/
      record.errors[attribute] << (options[:message] || "is not an IPv4 address.")
    end
  end
end