module ValidationHelper
  def uint?(value)
    value =~ /\A[0-9]+\z/
  end

  def ipV4?(value)
    value =~ /\A([0-9]+\.){3}[0-9]+\z/
  end

  def domain?(value)
    value =~ /\A[\w\-\.]*[+\w]\z/
  end

  def email?(value)
    value =~ /\A[\w._%+-]+@[\w.-]+\.[a-zA-Z]{2,4}\z/
  end
end