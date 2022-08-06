class PagesController < ApplicationController
  def home
  end

  def contact
    @user = current_user

  def about
  end
end
