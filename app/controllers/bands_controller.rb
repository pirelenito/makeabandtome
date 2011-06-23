class BandsController < ApplicationController

  def index  
  end

  def new
    redirect_to Band.generate
  end

  def show
   @band = Band.find params[:id]
  end

end
