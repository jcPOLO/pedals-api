require 'rails_helper'

RSpec.describe 'Components API' do
  # before do
  #   Project.destroy_all
  #   Component.destroy_all
  #   ComponentsProject.destroy_all
  # end
  
  let!(:project)            { create(:project) }
  let!(:components)         { build_list(:component, 20) }
  let!(:components_project) { create_list(:components_project, 20, project_id: project.id ) }


  let(:project_id)          { project.id }
  let(:id)                  { components.first.id }

  describe 'GET /api/v1/projects/:project_id/components' do
    before { get "/api/v1/projects/#{project_id}/components" }

    context 'when project exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all project components' do
        expect(json.size).to eq(20)
      end
    end

    context 'when project does not exist' do
      let(:project_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Project/)
      end
    end
  end

  describe 'GET /api/v1/projects/:project_id/components/:id' do
    before { get "/api/v1/projects/#{project_id}/components/#{id}"}

    context 'when project component exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      # it 'returns the component' do
      #   expect(json['id']).to eq(id)
      # end
    end

    context 'when project component does not exists' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Component/)
      end
    end
  end

  # Test suite for POST /projects/:project_id/components
  describe 'POST /api/v1/projects/:project_id/components' do
    let(:valid_attributes) { { component_type_id: 1, value: 12345 } }

    context 'when request attributes are valid' do
      before { post "/api/v1/projects/#{project_id}/components", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/api/v1/projects/#{project_id}/components", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/component_type_id: can't be blank/)
      end
    end
  end

  # Test suite for PUT /api/v1/projects/:project_id/components/:id
  describe 'PUT /api/v1/projects/:project_id/components/:id' do
    let(:valid_attributes) { { value: 200 } }

    before { put "/api/v1/projects/#{project_id}/components/#{id}", params: valid_attributes }

    context 'when component exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the component' do
        updated_component = Component.find(id)
        expect(updated_component.value).to match(200)
      end
    end

    context 'when the component does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Component/)
      end
    end
  end

  # Test suite for DELETE /api/v1/projects/:project_id/components/:id
  describe 'DELETE /api/v1/projects/:project_id/components/:id' do
    before { delete "/api/v1/projects/#{project_id}/components/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

