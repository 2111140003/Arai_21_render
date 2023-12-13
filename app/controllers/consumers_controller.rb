class ConsumersController < ApplicationController
  def new
    @consumer = Consumer.new
  end
  
  def create
    consumer = Consumer.new(consumer_params)
    if consumer.save
      session[:consumer_id] = consumer.id
      redirect_to consumer_path, notice: "signed in"
    else
      render :new
    end
  end

  def show
  end
  
  
  private
  def consumer_params
    params.require(:consumer).permit(:email, :password, :password_confirmation)
  end
end
