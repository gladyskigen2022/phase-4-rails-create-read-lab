class PlantsController < ApplicationController
    wrap_parameters format: []
    #GET /plants
    def index
        plants = Plant.all
        render json: plants, except: [:created_at, :updated_at]
    end

    #GET /plants/:id
    def show
        plant = Plant.find_by(id: params[:id])       
        if plant
            render json: plant,except: [:created_at, :updated_at]
        else
            render json: { error: "Plant not found"}, status: :not_found
        end
    end

    #POST /birds/:id
    def create
        plant = Plant.create(plant_params)
        render json: plant, except: [:created_at, :updated_at], status: :created
    end

    private
    # all methods here are private

    def plant_params
        params.permit(:id, :name, :image, :price)
    end
end
