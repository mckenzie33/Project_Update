FactoryGirl.define do
  factory :user do
   name   "Mike Hart"
   email  "mike@example.com"
   password  "foobar"
   password_confirmation "foobar"
  end
end
