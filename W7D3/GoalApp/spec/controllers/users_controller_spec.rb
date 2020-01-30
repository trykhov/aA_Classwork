require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "renders new" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it "valid user is saved into database" do
      post :create, params: { 
        user: {
          username: "bob",
          password: "abc123"
        }
      }
      expect(User.find_by(username: "bob")).to_not eq(nil)
    end
  end


end
