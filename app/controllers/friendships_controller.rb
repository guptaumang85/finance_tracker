class FriendshipsController < ApplicationController
  
  def create
    friendship = current_user.friendships.build(friend_id: params[:friend])
    if friendship.save
      flash[:notice] = "Follwing friend"
    else
      flash[:alert] = "There was something wrong with following this user."
    end
    redirect_to my_friends_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).take
    friendship.destroy
    flash[:notice] = "Unfollowed a friend."
    redirect_to my_friends_path
  end

end
