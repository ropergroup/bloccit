require 'random_data'

 # Create Posts
 50.times do

   Post.create!(

     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 # Create Comments

 100.times do
   Comment.create!(

     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

 # Create Questions
 50.times do

   Question.create!(

     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Question.all

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Question.count} questions created"
