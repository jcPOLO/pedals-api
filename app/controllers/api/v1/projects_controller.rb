module Api
  module V1
    class ProjectsController < ApplicationController
      before_action :set_project, only: [:show, :update, :destroy]

      # GET /projects
      def index
        projects = Project.all
        @projects = projects.where(inventory: false)
        @inventory = projects.where(inventory: true)

        render json: @projects
      end

      # GET /projects/1
      def show
        render json: { project: @project, components: @project.components }, status: :ok
      end

      # POST /projects
      def create
        @project = Project.new(project_params)

        if @project.save
          render json: @project, status: :created, location: @project
        else
          render json: @project.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /projects/1
      def update
        if @project.update(project_params)
          render json: @project, status: :ok
        else
          render json: @project.errors, status: :unprocessable_entity
        end
      end

      # DELETE /projects/1
      def destroy
        if @project.destroy
          head :no_content, status: :ok
        else
          render json: @project.errors, status: :unprocessable_entry
        end
      end

      def inventory
        @inventory = Project.find_by(inventory: true)
        render json: @inventory
      end
      
      private
        # Use callbacks to share common setup or constraints between actions.
      def set_project
        @project = Project.find(params[:id])
        # @project = Project.includes({ components: :componentsprojects }).find(params[:id])
      end

      def set_components
        @components = @project.components
      end

      def set_component_amount
        @component_amount = @components.

      # Only allow a trusted parameter "white list" through.
      # def project_params
      #   params.require(:project).permit(:name, :inventory)
      # end

      def project_params
        params.require(:project).permit(
          :name, components_projects_attributes: [
            :id, :amount, :_destroy, component_attributes: [
              :id, :value, :component_type_id,
              :model, :legs, :log, :rev, :_destroy
            ]
          ]
        )
      end
    end
  end
end
