class SpicesController < ApplicationController
    wrap_parameters format: []
    def index
        spices = Spice.all
        render json: spices
    end

    def show 
        spice = Spice.find_by(id: params[:id])
        if spice 
            render json: spice, status: :ok
        else 
            render json: { error: "Spice nof found" }, status: :not_found
        end
    end

    def create 
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update 
        spice = Spice.find_by(id: params[:id])
        if spice.update(spice_params)
        render json: spice, status: :accepted
        else 
            render json: { error: "Spice not found" }, status: :nof_found
        end

    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice.destroy
            head :no_content
        else
            render json: { error: "Spice nof found" }, status: :not_found
        end
    end


    private 
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
    
end
