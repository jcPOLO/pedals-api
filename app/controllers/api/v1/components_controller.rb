module Api
  module V1
    class ComponentsController < ApplicationController
      before_action :set_project,    except: :inventory
      before_action :set_inventory,  only: :inventory
      before_action :set_component,  only: %i[show update destroy]
      before_action :set_components, only: %i[index inventory]

      # GET /inventory
      def inventory
        render json: @components
      end

      # GET /projects/:project_id/components
      def index
        render json: @components
      end

      # GET /projects/:project_id/components/:id
      def show
        render json: @component
      end

      # POST /project/:project_id/components
      def create
        @component = Component.new(component_params)
        if @component.save
          render json: @component, status: :created
        else
          render json: @component.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /project/:project_id/components/:id
      def update
        if @component.update(component_params)
          render json: @component, status: :ok
        else
          render json: @component.errors, status: :unprocessable_entity
        end
      end

      # DELETE /project/:project_id/components/:id
      def destroy
        if @component.destroy
          head :no_content, status: :ok
        else
          render json: @component.errors, status: :unprocessable_entity
        end
      end

      private

      def set_project
        @project = Project.find(params[:project_id])
      end

      def set_inventory
        @project = Project.find_by(inventory: true)
      end

      def set_component
        @component = add_amount(@project.components.find(params[:id]))
      end

      def set_components
        @components = add_amount(@project.components)
      end

      def add_amount(components)
        @project.amounts(components)
      end

      def component_params
        params.permit(:value, :component_type_id, :model, :legs, :log, :rev)
      end
    end
  end
end
