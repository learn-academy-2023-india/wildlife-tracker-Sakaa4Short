class AnimalsController < ApplicationController
    def index
        @animals = Animal.all
        render json: @animals
    end 
    def show
    animal = Animal.find(params[:id])
    render json: animal
    end
    def create
        animal = Animal.create(animal_params)
        if animal.valid?
            render json: animal
        else
            render jason: chicken.errors
        end
    end
    def update
        animal = Animal.find(params[:id])
        animal.update(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end
    end
    def destroy
        animal = Animal.find(parames[:id])
        animals = Animal.all
        if animal.destroy
            render json: animals
        else
            render json: animal.errors
        end
    end
    
    private
    def animal_params
        params.require(:animal).permit(:common_name, :scientific_binomial)
    end

end
