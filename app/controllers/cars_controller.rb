class CarsController < ApplicationController

  before_action :find_car, only: [:edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
    @car.pictures.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to cars_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @car.update(car_params.except(:pictures_attributes))
      if params[:car][:pictures_attributes]
        unless @car.pictures.empty?
          params[:car][:pictures_attributes].each_value do |picture|
            @car.pictures.find_by(id: picture[:id]).update(image: picture[:image])
          end
        else
          params[:car][:pictures_attributes].each_value do |picture|
            @car.pictures.create(image: picture[:image])
          end
        end
      end
      redirect_to cars_path
    else
      render :edit
    end
  end

  def destroy
    @car.pictures.destroy_all
    @car.destroy
    redirect_to cars_path
  end

  private

  def car_params
    params.require(:car).permit(:name, :car_number, :car_passport, :date_of_issue_passport, pictures_attributes: [:id, :image, :car_id])
  end

  def find_car
    @car = Car.find_by(id: params[:id])
    render_404 unless @car
  end

end
