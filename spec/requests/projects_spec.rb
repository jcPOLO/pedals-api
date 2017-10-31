
require 'rails_helper'

RSpec.describe 'Projects API', type: :request do
  before do
    Project.destroy_all
    Component.destroy_all
    ComponentsProject.destroy_all
  end

  let!(:projects) { create_list(:project, 2) }
  let(:project_id) { projects.first.id }

  describe 'GET /api/v1/projects' do
    before { get '/api/v1/projects' }

    it 'returns projects' do
      expect(json.size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/projects/:id' do
    before { get "/api/v1/projects/#{project_id}" }

    context 'when the record exists' do
      it 'returns the project' do
        expect(json).not_to be_nil
        expect(json['id']).to eq(project_id)
        expect(response).to match_response_schema('project')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:project_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Project/)
      end
    end
  end

  describe 'POST /api/v1/projects' do
    let(:valid_attributes) { { name: 'PRoCO RAT' } }

    context 'when the request is valid' do
      before { post '/api/v1/projects', params: valid_attributes }

      it 'creates a project' do
        expect(json['name']).to eq('PRoCO RAT')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/projects', params: { name: ' ' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'DELETE /api/v1/projects/:id' do
    before { delete "/api/v1/projects/#{project_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end


