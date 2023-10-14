class SpicesController < ApplicationController
  wrap_parameters format:[]
  # GET/spices
  def index
    render json: Spice.all, status: :ok
  end

  # SHOW/spices/:id
  def show
    spice = Spice.find_by(id: params[:id])
    if spice
      render json: spice, status: :ok
    else
      render json: { error: "Spice not found" }, status: :not_found
    end
  end

  #POST/spices/:id
  def create
    # spice = Spice.create(title: params[:title], image: params[:image],description: params[:description],notes: params[:notes],rating: params[:rating])
    spice = Spice.create(spice_params)
    render json: spice, status: :created
    
  end

  #PATCH/spices/:id
  def update
    spice = Spice.find_by(id: params[:id])
    if spice 
      spice.update(spice_params)
      render json:spice, status: :accepted
    else
      render json: { error: "Spice not found" }, status: :not_found
    end



# DElETE/spices/:id

def destroy
  spice = Spice.find_by(id: params[:id])
  if spice
    spice.destroy
    head :no_content
  else
   render json: { error: "Spice not found" }, status: :not_found
  end
end

  end




  private

  def spice_params
    params.permit(:title,:description,:image,:notes,:rating)
  end
end
