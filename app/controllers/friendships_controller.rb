class FriendshipsController < ApplicationController
  def create
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).take
    friendship.destroy
    flash[:notice] = "Unfollowed a friend."
    redirect_to my_friends_path
  end
end
