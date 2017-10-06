module Api
  module V1
    class ComponentsController < ApplicationController
      before_action :set_project
      before_action :set_component, only: [:show, :edit, :new, :update, :destroy]
      before_action :set_components, only: [:show, :index]
      before_action :set_component_amount, only: [:show, :index]

      # GET projects/1/components
      def index
        render json: @components
      end

      # GET projects/1/components/1
      def show
        @components.each do |c|
          if c.id == @component.id
            return render json: { component: @component, amount: @component_amount }
          end
        end
        render json: @component.errors, status: :unprocessable_entity
      end

      # POST /components
      # def create
      #   @component = Component.new(component_params)

      #   if @component.save
      #     render json: @component, status: :created, location: @component
      #   else
      #     render json: @component.errors, status: :unprocessable_entity
      #   end
      # end

      # PATCH/PUT /components/1
      def update
        if @component.update(component_params)
          render json: @component, status: :ok
        else
          render json: @component.errors, status: :unprocessable_entity
        end
      end

      # DELETE /components/1
      def destroy
        if @component.destroy
          head :no_content, status: :ok
        else
          render json: @component.errors, status: :unprocessable_entry
        end
      end

      # def new
      #   @component.assignments.find_by(project_id: @project)
      # end

      # def edit
      #   @assignment = @component.assignments.find_by(
      #     project_id: @project
      #     )
      # end

      private
        # Use callbacks to share common setup or constraints between actions.
        # def set_component
        #   @component = Component.find(params[:id])
        # end
      def set_project
        @project = Project.find(params[:project_id])
      end

      def set_component
        # @component = @project.components.find(params[:id])
        @component = Component.find(params[:id])
      end

      def set_components
        @components = @project.components
      end

      def set_component_type
        @component_type = Component.find(params[:component_type_id])
      end

      def set_component_amount
        @component_amount = ComponentsProject.find_by(
                              project_id:   @project.id, 
                              component_id: @component.id
                            ).amount
      end

        # Only allow a trusted parameter "white list" through.
        # def component_params
        #   params.require(:component).permit(:value, :legs, :log, :rev)
        # end
      def component_params
        params.require(:component).permit(
          :value, :component_type_id, :model, :legs, :log, :rev,
            components_projects_attributes: [
              :id, :amount, :project_id,:component_id, :_destroy
            ]
        )
      end
    end
  end
end
