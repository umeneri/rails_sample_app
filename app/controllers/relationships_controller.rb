class RelationshipsController < ApplicationController
   before_action :logged_in_user

   # follow
   def create
     # <div><%= hidden_field_tag :followed_id, @user.id %></div> (follow.html)
     @user = User.find(params[:followed_id])
     current_user.follow(@user)
     # redirect_to user
     respond_to do |format|
       format.html { redirect_to @user}
       format.js
     end
   end

   # unfollow
   def destroy
     @user = Relationship.find(params[:id]).followed  # idで与えられるユーザのフォローしているユーザ
     current_user.unfollow(@user)
     # redirect_to user
     respond_to do |format|
       format.html { redirect_to @user}
       format.js
     end
   end
end
