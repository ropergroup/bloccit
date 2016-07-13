class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create

     @post = Post.new
     @post.title = params[:post][:title]
     @post.body = params[:post][:body]
     @topic = Topic.find(params[:topic_id])

     @post.topic = @topic

     if @post.save

       flash[:notice] = "Post was saved successfully."
       redirect_to [@topic, @post]
     else

       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :new
     end
   end

  def edit
    @post = Post.find(params[:id])
  end

  def update
     @post = Post.find(params[:id])
     @post.title = params[:post][:title]
     @post.body = params[:post][:body]

     if @post.save
       flash[:notice] = "Post was updated successfully."
       redirect_to [@post.topic, @post]
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :edit
     end
   end

   def destroy
      @post = Post.find(params[:id])


      if @post.destroy
        flash[:notice] = "\"#{@post.title}\" was deleted successfully."
        redirect_to @post.topic
      else
        flash.now[:alert] = "There was an error deleting the post."
        render :show
      end
    end
end
