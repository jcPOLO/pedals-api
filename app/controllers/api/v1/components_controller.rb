module Api
  module V1
    class ComponentsController < ApplicationController
      before_action :set_project
      before_action :set_component, only: [:show, :edit, :new, :update, :destroy]
      before_action :set_components, only: [:show, :index]
      # before_action :set_amount, only: [:show]

      # GET /projects/:project_id/components
      def index
        json_response(@components)
      end

      # GET /projects/:project_id/components/:id
      def show
        @components.each do |c|
          if c.id == @component.id
            return render json: { component: @component, amount: @component_amount }
          end
        end
        render json: @component.errors, status: :unprocessable_entity
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
        # Use callbacks to share common setup or constraints between actions.
        # def set_component
        #   @component = Component.find(params[:id])
        # end
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
        @component.amount << @project.components_projects.find_by(component_id: @component.id)
      end

      def component_params
        params.permit(
          :value, :component_type_id, :model, :legs, :log, :rev,
            components_projects_attributes: [
              :id, :amount, :project_id,:component_id, :_destroy
            ]
        )
      end
    end
  end
end
