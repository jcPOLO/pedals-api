module Api
  module V1
    class ComponentsController < ApplicationController
      before_action :set_project,    except: :inventory
      before_action :set_inventory,  only: :inventory
      before_action :set_component,  only: %i[show update destroy]
      before_action :set_components, only: %i[index inventory]
      # before_action :check_amount,   only: :create

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
        # We do not create the component if it exists already in our inventory
        @component = @project.components.find_or_create_by!(component_params)

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
        params.permit(:value, :component_type, :model, :legs, :log, :rev,
                      :components_projects_attributes[:amount, :id, :_destroy, :project_id, :component_id])
      end
    end
  end
end

# p = Project.first
# params = { component: { component_type: 'Resistor', value: 101, components_projects_attributes: [{ amount: 69 }] } }
# p.components.create!(params[:component])
# p.components.create(component_type: 'Resistor', value: 102, components_projects_attributes: [amount: 69])