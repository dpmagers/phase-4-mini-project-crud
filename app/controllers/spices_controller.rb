class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    #GET
    def index
        spices = Spice.all
        render json: spices 
    end 

    def show
        spice = find_spice
          render json: spice
    end 

    #POST
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created 
    end 

    #PATCH
    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice
    end 

    #DELETE
    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end 


    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end 

    def render_not_found_response
        render json: { error: "Spice not found" }, status: :not_found
    end 

    def find_spice
        spice = Spice.find_by(id: params[:id])
    end 



end
