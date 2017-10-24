module Api
  module V1
    class ComponentsController < ApplicationController
      before_action :set_project,    except: :inventory
      before_action :set_inventory,  only: %i[inventory create]
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
        if @project.id != @inventory.id # Si el componente a crear no es para el inventario...
          component = @inventory.components.find_or_initialize_by(component_params[:component]) # lo creamos (habria que quitar amount de params)
          if component.save #si el componente no existia lo habriamos creado
            components_project = @inventory.components_projects.find_or_initialize_by(component_id: component.id, amount: 0)
            components_project.save
          end
          components_project = @project.components_projects.find_or_initialize_by(component_id: component.id, amount: component_params[:amount])
          components_project.save
        else
          # Si llegamos hasta este punto, es que el componente es para meter unicamente en el inventario
          component = @inventory.components.find_or_initialize_by(component_params[:component]) # lo creamos (habria que quitar amount de params)
          if component.save
            components_project = @project.components_projects.find_or_initialize_by(component_id: component.id, amount: component_params[:amount])
            components_project.save
          end
        end
        @component = components_project.component
        if @component
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
 #       In some cases you will want to nest to nest the create action as well if the resources should be created in the context of another:

# class API::V1::Posts::CommentsController < ApplicationController
#  # PATCH /api/v1/posts/:post_id/comments
#  def create
#    @post = Post.find(params[:post_id])
#    @comment = @post.comments.create(comment_params)
#    respond_with(@comment)
#  end
#
#  # GET /api/v1/posts/:post_id/comments
#  def index
#    @post = Post.eager_load(:comments).find(params[:post_id])
#    respond_with(@post.comments)
#  end
# end
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
        params.permit(:value, :component_type, :model, :legs, :log, :rev, :amount, :project_id, component: {})
      end
    end
  end
end
