class DomainValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A[\w\-\.]*[+\w]\z/
      record.errors[attribute] << (options[:message] || "is not a domain.")
    end
  end
end