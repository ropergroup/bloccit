require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do

  let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }

   let(:my_sponsored_post) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }



      describe "GET new" do
           it "returns http success" do
             get :new, topic_id: my_topic.id
             expect(response).to have_http_status(:success)
           end


           it "renders the #new view" do
             get :new, topic_id: my_topic.id
             expect(response).to render_template :new
           end


           it "instantiates @sponsored_post" do
             get :new, topic_id: my_topic.id
             expect(assigns(:sponsored_post)).not_to be_nil
           end
         end

         describe "sponsored_post create" do

           it "increases the number of Sponsored Post by 1" do
             expect{post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(sponsored_post,:count).by(1)
           end


           it "assigns the new post to @post" do
             expect{post :create, topic_id: my_topic.id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(sponsored_post,:count).by(1)
             expect(assigns(:sponsored_post)).to eq sponsored_post.last
           end


           it "redirects to the new sponsored_post" do
             post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}

             expect(response).to redirect_to [my_topic, sponsored_post.last]
           end
         end

         describe "GET show" do
          it "returns http success" do

            get :show, topic_id: my_topic.id, id: my_sponsored_post.id
            expect(response).to have_http_status(:success)
          end
          it "renders the #show view" do

            get :show, topic_id: my_topic.id, id: my_sponsored_post.id
            expect(response).to render_template :show
          end

          it "assigns my_sponsored_post to @sponsored_post" do
            get :show, topic_id: my_topic.id, id: my_sponsored_post.id

            expect(assigns(:sponsored_post)).to eq(my_sponsored_post)
          end
        end

        describe "GET edit" do
           it "returns http success" do
             get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
             expect(response).to have_http_status(:success)
           end

           it "renders the #edit view" do
             get :edit, topic_id: my_topic.id, id: my_sponsored_post.id

             expect(response).to render_template :edit
           end


           it "assigns sponsored post to be updated to @sponsored_post" do
             get :edit, topic_id: my_topic.id, id: my_sponsored_post.id

             sponsored_post_instance = assigns(:sponsored_post)

             expect(sponsored_post_instance.id).to eq my_sponsored_post.id
             expect(sponsored_post_instance.title).to eq my_sponsored_post.title
             expect(sponsored_post_instance.body).to eq my_sponsored_post.body
           end
         end

       describe "PUT update" do
         it "updates sponsored post with expected attributes" do
           new_title = RandomData.random_sentence
           new_body = RandomData.random_paragraph

           put :update, topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body}

           updated_post = assigns(:sponsored_post)
           expect(updated_sponsored_post.id).to eq my_post.id
           expect(updated_sponsored_post.title).to eq new_title
           expect(updated_sponsored_post.body).to eq new_body
        end

     it "redirects to the updated sponsored post" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph


       put :update, topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body}
       expect(response).to redirect_to [my_topic, my_sponsored_post]
     end
   end

   describe "DELETE destroy" do
       it "deletes the sponsored post" do
         delete :destroy, topic_id: my_topic.id, id: my_sponsored_post.id

         count = Post.where({id: my_sponsored_post.id}).size
         expect(count).to eq 0
       end

       it "redirects to topic show" do
       delete :destroy, topic_id: my_topic.id, id: my_sponsored_post.id
       expect(response).to redirect_to my_topic
       end
     end

end
