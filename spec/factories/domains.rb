# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :domain do
    name "MyString"
    master "MyString"
    last_check 1
    type ""
    notified_serial 1
    account "MyString"
  end
end
