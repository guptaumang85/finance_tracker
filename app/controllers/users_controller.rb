class UsersController < ApplicationController
  
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @my_friends = current_user.friends
  end

  def search 
    if params[:friend].present?
      @friend = params[:friend]
      if @friend
        respond_to do |format|
          format.js { render 'users/friend_result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = 'Please enter a valid friend name search.'
          format.js { render 'users/friend_result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = 'Please enter a something to search.'
        format.js { render 'users/friend_result' }
      end
    end
  end

end
