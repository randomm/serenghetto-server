require 'factory_girl'

Factory.define :user do |u|
  u.name 'Test User'
  u.email 'user@test.com'
  u.password 'please'
end

Factory.define :barcode do |b|
  b.name 'Test Name'
  b.description 'Test Description Lorem Ipsum Doret Laalaa'
  b.barcode '012345678901234567890'
end
