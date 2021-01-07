require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe "GET #index" do
        it "renders all users" do
            get :index
            expect(response).to be_success
            expect(response).to render_template(:index)
        end
    end

    describe "GET #new" do
      it "renders new users page" do
        get :new
        expect(response).to be_success
        expect(response).to render_template(:new)
      end
    end

    describe "GET #show" do
      it "renders a user" do
        User.create!(name: "joe", email: "joe@email.com", password: "123456")
        get :show, id: 1
        expect(response).to be_success
        expect(response).to render_template(user_url(user))
      end

      it "does not show non-existent users" do
        begin
            get :show, id: -1
        rescue
            ActiveRecord::RecordNotFound
        end
        expect(response).not_to render_template(user_url(user))
      end
    end

    describe "GET #edit" do
      it "renders a edit users page" do
        get :edit
        expect(response).to be_success
        expect(response).to render_template(:edit)
      end 
    end

    describe "POST #create" do
      context "with invalid params" do
        it "fails with short password" do
            post :create, params: { user: { name: "billy", email: "billy@email.com", password: ""} }
            expect(response).to render_template(:new)
        end

        it "fail with present parameters" do
            post :create, params: { user: { password: "123456"} }
            expect(response).to render_template(:new)
        end
      end

      context "with valid params" do

        post :create, params: { user: { name: "sam", email: "sam@email.com", password: "123456"} }
        expect(response).to render_template(user_url(user))
      end
    end

end
