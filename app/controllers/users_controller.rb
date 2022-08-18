class UsersController < ApplicationController
  def index
   @book = Book.new
   @users = User.all
   @user = current_user
  end
  
  def show
   @user = User.find(params[:id])
   @book = Book.new
   @books = @user.books.all
   
  end

  def edit
    @user = User.find(params[:id])
   if @user == current_user
    render :edit
   else
    redirect_to user_path(current_user.id)
   end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
    render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

