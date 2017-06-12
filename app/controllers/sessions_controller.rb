class SessionsController < ApplicationController
  layout 'thiny'
  skip_before_action :login_required?
  DEFAUTL_USERNAME = 'admin'.freeze
  DEFAULT_PASSWORD = '123456'.freeze

  def new
  end

  def create
    if params[:username] == DEFAUTL_USERNAME && params[:password] == DEFAULT_PASSWORD
      session[:username] = DEFAUTL_USERNAME
      redirect_to root_url, notice: '登录成功'
    else
      redirect_to new_session_path, notice: '账号或密码错误'
    end
  end
end
