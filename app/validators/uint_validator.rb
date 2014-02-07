class UintValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A[0-9]+\z/
      record.errors[attribute] << (options[:message] || "is not an unsigned integer.")
    end
  end
end