class CarsController < ApplicationController

  before_action :find_car, only: [:edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to cars_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to cars_path
    else
      render "edit"
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:name, :car_number, :car_passport, :date_of_issue_passport)
  end

  def find_car
    @car = Car.find_by(id: params[:id])
    render_404 unless @car
  end

end
