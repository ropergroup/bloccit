class Api::V1::UsersController < Api::V1::BaseController
   before_action :authenticate_user
   before_action :authorize_user

   def show
     user = User.find(params[:id])
     render json: user, status: 200
   end

   def index
     users = User.all
     render json: users, status: 200
   end
 end
