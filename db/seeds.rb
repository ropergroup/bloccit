require 'random_data'

# Create Users
   5.times do
      User.create!(
      name:     RandomData.random_name,
      email:    RandomData.random_email,
      password: RandomData.random_sentence
      )
   end
   users = User.all


   # Create Topics
   15.times do
      Topic.create!(
      name:         RandomData.random_sentence,
      description:  RandomData.random_paragraph
      )
   end
   topics = Topic.all

   # Create Posts
   50.times do
  post = Post.create!(
     user:   users.sample,
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
   post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
   rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
 end
  posts = Post.all


   # Create Comments
   100.times do
   Comment.create!(
      user: users.sample,
      post: posts.sample,
      body: RandomData.random_paragraph
      )
   end

    # Create an admin user
    admin = User.create!(
      name:     'Admin User',
      email:    'admin@example.com',
      password: 'helloworld',
      role:     'admin'
    )

    # Create a member
    member = User.create!(
      name:     'Member User',
      email:    'member@example.com',
      password: 'helloworld'
    )

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Vote.count} votes created"
