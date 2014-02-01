class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A[\w._%+-]+@[\w.-]+\.[a-zA-Z]{2,4}\z/
      record.errors[attribute] << (options[:message] || "is not an email.")
    end
  end
end