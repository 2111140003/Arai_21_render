class ConsumersController < ApplicationController
  def new
    @consumer = Consumer.new
  end
  
  def create
    
    @consumer = Consumer.new(consumer_params)
    puts "=== Debug: AAAAAAAA ==="
    if @consumer.save
      puts "=== Debug: create action ==="
      session[:consumer_id] = @consumer.id
      redirect_to root_path, notice: "signed in"
    else
      render :new
      puts "=== Debug: Validation Errors ==="
      puts @consumer.errors.full_messages

    end
  end

  def show
  end
  
  
  private
  def consumer_params
    params.require(:consumer).permit(:email, :password, :password_confirmation, team_attributes: [:name])
  end
end
