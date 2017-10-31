module Api
  module V1
    class ComponentsController < ApplicationController
      before_action :set_project,    except: :inventory
      before_action :set_inventory,  only: %i[inventory create]
      before_action :set_inventory_components, only: :inventory
      before_action :set_component,  only: %i[show update destroy]
      before_action :set_components, only: %i[index]

      # GET /inventory
      def inventory
        render json: @inventory
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
        component = create_component
        @component = add_amount(component)
        if @component
          render json: @component, status: :created
        else
          json_response(@component.errors, :unprocessable_entity)
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
        @inventory = Project.find_by(inventory: true)
      end

      def set_inventory_components
        @inventory = @inventory.amounts(@inventory.components)
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

      def component_params
      params.permit(:value, :component_type, :model, :legs,
                    :log, :rev, :amount, :project_id, component: {})
      end
    end
  end
end
