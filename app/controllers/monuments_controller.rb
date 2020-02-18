class MonumentsController < ApplicationController
  skip_before_action :authenticate_user! only: [:show, :search]
  before_action :set_monument, only: [:show, :edit, :update, :destroy]
end

def new
  @monument = Monument.new(monument_params)
end

def create
  @monument = Monument.new(monument_params)
  @monument.user = current_user
  if @monument.save
    redirect_to monument_path
  else
    render :new
  end
end

def show
  @monument = Monument.find[params[:id]]
end

def edit
end

def update
  if @monument.update(monument_params)
    redirect_to monument_path(@mo)
  else
    render :edit
  end
end

def destroy
  @monument.destroy
end

private

def set_monument
  @monument = Monument.find(params[:id])
end

def monument_params
  params.require(:monument).permit(:user, :address, :name, :price, :description, :city)
end


