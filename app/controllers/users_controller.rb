class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]

  set_main_menu :settings
  set_sub_menu :users

  def index
    @users = User.all.paginate(:page => params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Пользователь зарегистрирован."
      redirect_back_or_default account_path
    else
      render :action => :new
    end
  end

  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Пользователь обновлён!"
      redirect_to account_path
    else
      render :action => :edit
    end
  end
end

