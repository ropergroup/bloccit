class Api::V1::CommentController < Api::V1::BaseController

   before_action :authenticate_user, except: [:index, :show]
   before_action :authorize_user, except: [:index, :show]

   def index
      comments = Comment.all
      render json: comment, status: 200
   end

   def show
      comment = Comment.find(params[:id])
      render json: comment, status: 200
   end
 end
