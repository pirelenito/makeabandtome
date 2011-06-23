class BandsController < ApplicationController

  def new
    redirect_to Band.generate
  end

  def show
   @band = Band.find params[:id]
  end

end
