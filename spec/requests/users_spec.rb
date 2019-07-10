require 'rails_helper'

RSpec.describe UsersController, type: :controller do
   describe 'User controller request specs' do
      login_user
  
      context 'GET #index' do 
         it 'should success and render to index page' do
            get :index
            expect(response).to have_http_status(200)
            expect(response).to render_template :index
         end
      end

      context 'GET #show' do
         let!(:user) { FactoryGirl.create(:user) }
         it 'should display the details of a particular user' do
            get :show, params: { id: user.id }
            expect(response).to have_http_status(200)
            expect(response).to render_template :show
         end
      end

      context 'PUT #update' do
         let!(:user) { FactoryGirl.create(:user) }
         it 'should update an existing user and display a success notice' do
            params = {
               name: 'Test User',
               address: 'SELISE, TTPL',
               phone: '17804011'
            }
            put(:update, params: { id: user.id, user: params })
            user.reload
            params.keys.each do |key|
               expect(user.attributes[key.to_s]).to eq params[key]
            end
            expect(flash[:notice]).to eq 'User successfully updated.'
         end
      end
   
      context 'DELETE #destroy' do
         let!(:user) { FactoryGirl.create(:user) }
         it 'should delete a user and display a success notice' do
            expect { delete :destroy, params: { id: user.id } }.to change(User, :count).by(-1)
            expect(flash[:notice]).to eq 'User successfully removed.'
         end
      end
   end
end