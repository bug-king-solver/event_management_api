# spec/controllers/events_controller_spec.rb
require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:valid_attributes) {
    { title: "Sample Event", description: "This is a sample event.", capacity: 100 }
  }

  let(:invalid_attributes) {
    { title: nil, description: "This is a sample event.", capacity: 100 }
  }

  describe "GET #index" do
    it "returns a success response" do
      Event.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      event = Event.create! valid_attributes
      get :show, params: { id: event.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Event" do
        expect {
          post :create, params: { event: valid_attributes }
        }.to change(Event, :count).by(1)
      end

      it "renders a JSON response with the new event" do
        post :create, params: { event: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the new event" do
        post :create, params: { event: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end
end
