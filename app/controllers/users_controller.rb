class UsersController < ApplicationController
  def index
   @user = User.all
   @book = Book.find(params[:id])
  end
  
  def show
   @book = Book.find(params[:id])
   @user = current_user
   @books = Book.all
   
  end

  def edit
   @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id), notice:  "You have updated user successfully."
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :index)
  end
end
