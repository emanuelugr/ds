class PersonajesController < ApplicationController

    def index
        #@personajes = Personaje.where(usuario: params[:usuario])
        @personajes = Personaje.all
        logger.info "Cargando los personajes del usuario: #{params[:usuario]}, Total: #{@personajes.count}"
        render json: @tareas
    end

    def create
        @personaje = Personaje.new(personaje_params)
        if @personaje.save
            render json: @personaje, status: :created
        else
            render json: @personaje.errors, status: :unprocessable_entity
        end
    end


    def update
        @personaje = Personaje.find(params[:id])
        if @personaje.update(personaje_params)
            render json: @personaje
        else
            render json: @personaje.errors, status: :unprocessable_entity
        end
    end

    def destroy
        personaje = Personaje.find(params[:id])
        if personaje.destroy
            head :ok
        else
            render json: { error: "Failed to delete" }, status: :unprocessable_entity
        end
    end

    private

    def personaje_params
        params.require(:personaje).permit(:nombre, :raza, :clase, :primAttr, :secAttr)
    end
end
