class UsersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]
  
  def index
    @users =User.all
    @user = current_user
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @books = @user.books
  end
  
  def edit
    @user = User.find(params[:id])
      if @user == current_user
        render "edit"
      else
        redirect_to user_path(current_user)
      end
  end
    
  def update
    @user = User.find(params[:id])
    @user.id = current_user.id
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      render "edit"
    end
  end
    
    private
    
    def user_params
      params.require(:user).permit(:profile_image, :name, :introduction)
    end
    
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
