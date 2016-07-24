FactoryGirl.define do
  factory :label do
    name RandomData.random_word
    topic
    post
    user
  end
end
