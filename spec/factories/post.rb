FactoryGirl.define do
  factory :post do
    title "Post Title"
    body "Post bodies must be pretty long."
    user
    topic {Topic.create(name: 'Topic name')}


      factory :post_with_comments do

       after(:create) do |post|
        create_list(:comment, 3,  post: post ,user: post.user)
      end
  end
end
end