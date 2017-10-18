module Api
  module V1
    class ProjectsController < ApplicationController
      before_action :set_project, only: %i[show update destroy]

      # GET /projects
      def index
        projects = Project.all
        @projects = projects.where(inventory: false)

        json_response(@projects)
      end

      # GET /inventory
      def inventory
        project_inventory = Project.find_by(inventory: true)
        components_amount = ComponentsProject.where(
          project_id: project_inventory.id
        )

        @inventory = project_inventory.components

        json_response @inventory
      end

      # GET /projects/:id
      def show
        # json_response({ project: @project, components: @project.components })
        json_response(@project)
      end

      # POST /projects
      def create
        @project = Project.create!(project_params)
        json_response(@project, :created)
        # if @project.save
        #   render json: @project, status: :created, location: @project
        # else
        #   json_response(@project.errors, :unprocessable_entity)
        # end
      end

      # PATCH/PUT /projects/1
      def update
        if @project.update(project_params)
          json_response @project
        else
          json_response(@project.errors, :unprocessable_entity)
        end
      end

      # DELETE /projects/1
      def destroy
        if @project.destroy
          head :no_content, status: :ok
        else
          json_response(@project.errors, :unprocessable_entry)
        end
      end
      
      private
        # Use callbacks to share common setup or constraints between actions.
      def set_project
        #@project = Project.find(params[:id])
        @project = Project.includes(:components, :components_projects).find(params[:id])
      end

      def set_components
        @components = @project.components
      end

      # Only allow a trusted parameter "white list" through.
      # def project_params
      #   params.require(:project).permit(:name, :inventory)
      # end

      def project_params
        params.permit(
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
