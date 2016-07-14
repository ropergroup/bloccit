class SponsoredPostsController < ApplicationController

  def show
    @sponsoredpost = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsoredpost = SponsoredPost.new
  end

  def create

     @sponsoredpost = SponsoredPost.new
     @sponsoredpost.title = params[:sponsoredpost][:title]
     @sponsoredpost.body = params[:sponsoredpost][:body]
     @topic = Topic.find(params[:topic_id])

     @sponsoredpost.topic = @topic

     if @sponsoredpost.save

       flash[:notice] = "Sponsored post was saved successfully."
       redirect_to [@topic, @sponsoredpost]
     else

       flash.now[:alert] = "There was an error saving the sponsored post. Please try again."
       render :new
     end
   end

  def edit
    @sponsoredpost = SponsoredPost.find(params[:id])
  end

  def update
     @sponsoredpost = SponsoredPost.find(params[:id])
     @sponsoredpost.title = params[:sponsoredpost][:title]
     @sponsoredpost.body = params[:sponsoredpost][:body]

     if @sponsoredpost.save
       flash[:notice] = "Post was updated successfully."
       redirect_to [@sponsoredpost.topic, @sponsoredpost]
     else
       flash.now[:alert] = "There was an error saving the sponsored post. Please try again."
       render :edit
     end
   end

   def destroy
      @sponsoredpost = SponsoredPost.find(params[:id])


      if @sponsoredpost.destroy
        flash[:notice] = "\"#{@sponsoredpost.title}\" was deleted successfully."
        redirect_to @sponsoredpost.topic
      else
        flash.now[:alert] = "There was an error deleting the sponsored post."
        render :show
      end
    end
end
