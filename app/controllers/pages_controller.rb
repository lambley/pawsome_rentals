class PagesController < ApplicationController
  def home
  end

  def contact
    @user = current_user
  end

  def about
    @three_costumes = []
    3.times do
      @three_costumes << Costume.all.sample
    end
  end
end
