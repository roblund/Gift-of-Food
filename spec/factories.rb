FactoryGirl.define do
  factory :neighborhood do
    name "Meadowy Meadows"
    file_id "2012_1"
    drop_location 1
  end

  factory :volunteer do
    first_name "Clark"
    last_name "Kent"
    email "mr_s@example.com.invalid"
    phone "444-444-4444"
  end
end
