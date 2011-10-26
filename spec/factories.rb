require 'factory_girl'

FactoryGirl.define do
  factory :user do |u|
    u.name 'Test User'
    u.email 'user@test.com'
    u.password 'please'
  end

  factory :barcode do |b|
    b.name 'Test Name'
    b.code '01234567890'
    b.association :user
  end

  factory :barcode_location do |b|
    b.barcode_id 1
    b.user_id 1
    b.geom Point.from_x_y(24.523424, 61.12345, 4326)
    b.device_timestamp Time.now
    b.accuracy 1.0
  end

end