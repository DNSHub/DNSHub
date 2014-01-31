# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :record do
    id { generate(:random_id) }
    name { "zone#{id}.example.com" }
    ttl 1
    prio 1
    change_date 1

    trait :master_domain do
      association :domain, :master
    end

    factory :a_record do
      type "A"
      content "127.0.0.1"
    end

    factory :cname_record do
      type "CNAME"
      content { "cname#{id}.example.com" }
    end

    factory :soa_record do
      type "SOA"
      content { "cname#{id}.example.com admin@cname#{id}.example.com 1 1 1 1 1" }
    end
  end
end
