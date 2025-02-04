class ApplicationController < ActionController::Base
  include SessionsHelper
  include UsersHelper

  before_action :search

    def search
      @q = Micropost.ransack(params[:q])
      @item = @q.result(distinct: true)
      @result = params[:q]&.values&.reject(&:blank?)
    end
end
