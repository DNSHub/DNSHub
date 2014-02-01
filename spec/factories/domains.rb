# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :domain do
    id { generate(:random_id) }
    name { "example#{id}.com" }

    trait :native do
     type "NATIVE"
    end

    trait :master do
     type "MASTER"
    end

    trait :slave do
     type "SLAVE"
     master { "192.168.1.#{(1..254).to_a.sample}" }
    end

    factory :native_domain, traits: [:native]
    factory :master_domain, traits: [:master]
    factory :slave_domain, traits: [:slave]
  end
end
