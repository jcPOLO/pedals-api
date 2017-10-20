module Api
  module V1
    class ComponentsController < ApplicationController
      before_action :set_project,    except: :inventory
      before_action :set_inventory,  only: :inventory
      before_action :set_component,  only: %i[show update destroy]
      before_action :set_components, only: %i[show index inventory]
      before_action :set_amount,     only: %i[show]

      # GET /inventory
      def inventory
        @a_components = []
        @components.each do |c|
          components_project = @project.amounts.find_by(component_id: c.id)
          hash_c = add_amount(c, components_project.amount)
          @a_components << hash_c
        end
        @components = @a_components
        json_response(@components)
      end

      # GET /projects/:project_id/components
      def index
        @a_components = []
        @components.each do |c|
          components_project = @project.amounts.find_by(component_id: c.id)
          hash_c = add_amount(c, components_project.amount)
          @a_components << hash_c
        end
        @components = @a_components
        json_response(@components)
      end

      # GET /projects/:project_id/components/:id
      def show
        class << @component
          attr_accessor :amount
        end
        component_amount = @project.amounts.find_by(component_id: @component.id).amount
        @component.amount = component_amount
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
          render json: @component.errors, status: :unprocessable_entry
        end
      end

      private

      def set_project
        @project = Project.find(params[:project_id])
      end

      def set_components
        @components = @project.components
      end

      def set_component
        @component = @project.components.find(params[:id])
      end

      def set_amount
        @components_project = @project.components_projects.find_by(
          component_id: @component.id
        )
        @component_amount = @components_project.amount
      end

      def set_inventory
        @project = Project.find_by(inventory: true)
      end

      def add_amount(component, amount = 0)
        json_component = component.to_json
        hash_component = JSON.parse(json_component)
        hash_component[:amount] = amount
        hash_component
      end

      def component_params
        params.permit(:value, :component_type_id, :model, :legs, :log, :rev)
      end
    end
  end
end
