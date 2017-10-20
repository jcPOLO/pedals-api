module Api
  module V1
    class ProjectsController < ApplicationController
      before_action :set_project, only: %i[show update destroy]

      # GET /projects
      def index
        @projects = Project.where(inventory: false)
        render json: @projects
      end

      # GET /projects/:id
      def show
        # json_response({ project: @project, components: @project.components })
        render json: @project
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

      def set_project
        @project = Project.find(params[:id])
      end

      def project_params
        params.permit(:name)
      end
    end
  end
end
