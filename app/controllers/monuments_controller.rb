class MonumentsController < ApplicationController
  skip_before_action :authenticate_user! only: [:index, :show, :search]
  before_action :set_monument, only: [:show, :edit, :update, :destroy]
end

def index
  if params[:query].present?
    @monuments = Monument.where("name ILIKE ?", "%#{params[:query]}%")
  else
    @monuments = Monument.all
  end
end

def new
  @monument = Monument.new
  authorize @monument
end

def create
  @monument = Monument.new(monument_params)
  @monument.user = current_user
  authorize @monument
  if @monument.save
    redirect_to monument_path(@monument)
  else
    render :new
  end
end

def show
end

def edit
  authorize @monument
end

def update
  authorize @monument
  if @monument.update(monument_params)
    redirect_to monument_path(@monument)
  else
    render :edit
  end
end

def destroy
  authorize @monument
  @monument.destroy
  redirect_to root_path
  # redirect to dashboard
end

private

def set_monument
  @monument = Monument.find(params[:id])
end

def monument_params
  params.require(:monument).permit(:user, :address, :name, :price, :description, :city)
end


