class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
    @property.stations.build
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path, notice: "登録しました！"
    else
      render :new
    end
  end

  def show
    @stations = @property.stations
  end

  def edit
    @count = @property.stations.count
    @count += 1
    @property.stations.build
  end

  def update
    binding.irb
    if params[:property][:station][:station].blank?
      if @property.update(property_params)
        redirect_to properties_path, notice: "物件をを編集しました！"
      else
        render :edit
      end
    else
      if @property.save
        redirect_to properties_path, notice: "登録しました！"
      end
    end
  end

  def destroy
    @i = Station.where(property_id: @property.id)
    @i.destroy_all
    @property.destroy
    redirect_to properties_path, notice:"物件を削除しました"
  end

  private
  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :rent, :address, :age, :note, stations_attributes: {})
  end
end
