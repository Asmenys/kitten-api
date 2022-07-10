class KittensController < ApplicationController
    def index
        @kittens = Kitten.all
    end

    def show
        @kitten = Kitten.find(params[:id])
    end

    def new
        @kitten = Kitten.new
    end

    def update
        @kitten = Kitten.find(params[:id])
        @kitten.update(kitten_params)
        flash.alert = "Kitten reconfigured successfully"
        redirect_to @kitten
    end

    def destroy
        @kitten = Kitten.find(params[:id])
        @kitten.delete
        flash.alert = "Kitten destroyed successfully"
        redirect_to root_path
    end
    
    def create
        @kitten = Kitten.new(kitten_params)
        if @kitten.save
            flash.alert = "Kitten spawned successfully"
            redirect_to @kitten
        else
            flash.alert = "You inconsiderate buffoon, why is your kitten incomplete?"
            render :edit, status: :unprocessable_entity
        end
    end

    def edit
        @kitten = Kitten.find(params[:id])
    end

    private

    def kitten_params
        params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
