class ApplicationController < ActionController::Base
  before_action :authenticate_student!

  protected

  def current_user
    @current_user ||= current_student
  end
end
