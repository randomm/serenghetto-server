require 'factory_girl'

#fac = RGeo::Cartesian.factory

FactoryGirl.define do
  factory :user do
    sequence :email do |n| 
      "user#{n}@test.com"
    end
    name 'Test User'
    password 'please'
  end

  factory :barcode do |b|
    b.name 'Test Name'
    b.code '01234567890'
    b.association :user
    b.after_create { |b| Factory(:barcode_location, :barcode => b, :user => b.user) }
  end

  factory :barcode_location do |b|
    b.name 'Test location'
    b.association :user
    b.association :barcode
    b.geom Point.from_x_y(24.523424, 61.12345, 4326)
    b.device_timestamp Time.now
    b.accuracy 1.0
  end
  
end