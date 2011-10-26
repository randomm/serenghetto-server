require 'factory_girl'

FactoryGirl.define do
  factory :user do |u|
    u.name 'Test User'
    u.email 'user@test.com'
    u.password 'please'
  end

  factory :barcode do |b|
    r = Random.new
    b.name 'Test Name'
    b.code r.rand(10000000000...99999999999).to_s
    b.user_id 1
  end

end