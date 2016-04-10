class FoodsController < ApplicationController
  before_action :find_food, only: [:show, :edit, :update, :destroy]

  def index
    @foods = Food.all.order("created_at DESC")
  end

  def show
  
  end

  def new
  	@food = Food.new
  end

  def create
  	@food = Food.new(food_params)
    if @food.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @food.destroy
    redirect_to food_path
  end

  def edit
  end

  def update
    if @food.update(food_params)
      redirect_to food_path(@food)
    else
      render 'edit'
    end
  end

  private 
  
  	def food_params
  		params.require(:food).permit(:title, :description, :price)
  	end	

    def find_food
       @food = Food.find(params[:id])
    end

end
