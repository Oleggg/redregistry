module Authentication
  def self.included(controller)
    controller.send(:helper_method,
                    :current_user,
                    :logged_in?,
                    :redirect_back_or_default,
                    :current_user?)
  end

  private

  def current_user?(user)
    current_user.id == user.id
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = 'Для доступа к этой странице нужно авторизоваться'
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:error] = 'Для доступа к этой странице нужно сначала выйти'
      redirect_to account_path
      return false
    end
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def logged_in?
    current_user
  end
end

