class TopicsController < ApplicationController
  def index
  	if (!session[:user])
  		redirect_to "/login"
  	end
  end

  def create
  end
end
