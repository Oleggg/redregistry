class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
    render :layout => 'login'
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to root_path, :notice => "Успешный вход."
      user = User.where(:login => @user_session.login).first
      Eventlog.log(:event_type => :user_login, :user_id => user.id, :data => {:login => user.login, :ip => request.remote_ip})
    else
      render :action => :new, :layout => 'login'
    end
  end

  def destroy
    Eventlog.log(:event_type => :user_logout, :user_id => current_user.id, :data => {:login => current_user.login})
    current_user_session.destroy
    redirect_to new_user_session_path, :notice => "До свидания."
  end
end

