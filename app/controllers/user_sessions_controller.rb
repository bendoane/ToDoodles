class UserSessionsController < ApplicationController
  before_action :require_no_user, only: [:new, :create]
    before_action :require_user, only: [:destroy]

    def new
      @user_session = UserSession.new
      end

    def create
      @user_session = UserSession.new(user_session_params)
        if @user_session.save
          redirect_to root_url
        else
          flash[:notice]="Try again. Something didn't work right. :("
          redirect_to new_user_session_path
        end
    end

    def destroy
      @user_session = UserSession.find
      @user_session.destroy
      redirect_to root_url
    end

    private
      def set_user_session
        @user_session = UserSession.find(params[:id])
      end

      def user_session_params
        params.require(:user_session).permit(:name, :password)
      end
  end
