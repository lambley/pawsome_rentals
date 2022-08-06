class PagesController < ApplicationController
  def home
  end

  def contact
    @user = current_user
  end
  
  def about
  end
end
