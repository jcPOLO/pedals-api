module Api
  module V1
    class ComponentsController < ApplicationController
      before_action :set_project,               except: :inventory
      before_action :set_inventory,             only: %i[inventory create]
      before_action :set_inventory_components,  only: :inventory
      before_action :set_component,             only: %i[show update destroy]
      before_action :set_component_final,       only: %i[show update destroy]
      before_action :set_components_final,      only: %i[index]

      # GET /inventory
      def inventory
        render json: @inventory
      end

      # GET /projects/:project_id/components
      def index
        render json: @components_final
      end

      # GET /projects/:project_id/components/:id
      def show
        render json: @component_final
      end
      # POST /project/:project_id/components
      def create
        component = create_component
        @component = add_amount(component)
        if @component
          render json: @component, status: :created
        else
          render json: @component.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /project/:project_id/components/:id
      def update
        @component = update_component
        if @component
          head :no_content, status: :ok
        else
          render json: @component.errors, status: :unprocessable_entity
        end
      end

      # DELETE /project/:project_id/components/:id
      def destroy
        if @component_final.destroy
          head :no_content, status: :ok
        else
          render json: @component_final.errors, status: :unprocessable_entity
        end
      end

      private

      def set_project
        @project = Project.find(params[:project_id])
      end

      def set_inventory
        @inventory = Project.find_by(inventory: true)
      end

      def set_component
        @component = @project.components.find(params[:id])
      end

      def set_inventory_components
        @inventory = @inventory.amounts(@inventory.components)
      end

      def set_component_final
        @component_final = add_amount(@component)
      end

      def set_components_final
        @components_final = add_amount(@project.components)
      end

      def add_amount(components)
        @project.amounts(components)
      end

      def create_component
        @component = Component.find_or_create_by!(component_params[:component])
        create_association(@project, @component, component_params[:amount])
        create_association(@inventory, @component) unless @project.inventory?
        @project.components.find(@component.id)
      end

      def create_association(project, component, amount = 0)
        ComponentsProject.find_or_create_by!(
          project_id: project.id,
          component_id: component.id,
          amount: amount
        )
      end

      def update_component
        update_association(@project, @component, component_params[:amount])
        @project.components.find(@component.id)
      end

      def update_association(project, component, amount = 0)
        ComponentsProject.find_by(
          project_id: project.id,
          component_id: component.id
        ).update(amount: amount)
      end

      def component_params
      params.permit(:value, :component_type, :model, :legs,
                    :log, :rev, :amount, :project_id, component: {})
      end
    end
  end
end
