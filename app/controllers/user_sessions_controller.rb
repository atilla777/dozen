class UserSessionsController < ApplicationController
  skip_before_filter :authenticate?

  def new
    @user_session = UserSession.new
    render layout: 'unregistered'
  end

  def create
    @user_session = UserSession.new(user_session_params)
    #byebug
    if @user_session.save
      flash[:success] = t('user_sessions.welcome')
      redirect_to root_path
    else
      #byebug
      flash[:danger] = t('user_sessions.wrong')
      render :new, layout: 'unregistered'
    end
  end

  def destroy
    current_user_session.destroy
    flash[:success] = t('user_sessions.goodbay')
    redirect_to root_path
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password)
  end
end
