# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :record do
    domain ""
    name "MyString"
    type ""
    content "MyString"
    ttl 1
    prio 1
    change_date 1
  end
end
