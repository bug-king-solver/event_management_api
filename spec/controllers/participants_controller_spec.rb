# spec/controllers/participants_controller_spec.rb
require 'rails_helper'

RSpec.describe ParticipantsController, type: :controller do
  let(:event) { create(:event) }
  let(:valid_attributes) {
    { name: "John Doe", email: "john.doe@example.com", event_id: event.id }
  }

  let(:invalid_attributes) {
    { name: nil, email: "john.doe@example.com", event_id: event.id }
  }

  describe "GET #index" do
    it "returns a success response" do
      Participant.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      participant = Participant.create! valid_attributes
      get :show, params: { id: participant.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Participant" do
        expect {
          post :create, params: { participant: valid_attributes }
        }.to change(Participant, :count).by(1)
      end

      it "renders a JSON response with the new participant" do
        post :create, params: { participant: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the new participant" do
        post :create, params: { participant: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end
end
