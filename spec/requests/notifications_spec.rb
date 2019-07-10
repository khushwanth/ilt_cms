require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do
   describe 'Notification controller request specs' do
      login_user
  
      context 'GET #index' do 
         it 'should success and render to index page' do
            get :index
            expect(response).to have_http_status(200)
            expect(response).to render_template :index
         end
      end

      context 'GET #show' do
         let!(:notification) { FactoryGirl.create(:notification) }
         it 'should display the details of a particular notification' do
            get :show, params: { id: notification.id }
            expect(response).to have_http_status(200)
            expect(response).to render_template :show
         end
      end

      context 'POST #create' do
         it 'should create an notification and display a success notice' do
            params =   {
              title: 'New Notification',
              body: 'This is a test notification generated',
              image_path: 'notifs/images/image.png'
            }
            expect { post(:create, params: { notification: params }) }.to change(Notification, :count).by(1)
            expect(flash[:notice]).to eq 'News successfully created.'
         end
      end

      context 'PUT #update' do
         let!(:notification) { FactoryGirl.create(:notification) }
         it 'should update an existing notification and display a success notice' do
            params = {
               title: 'Test Notification Updated',
               body: 'The description of the test notification is now edited'
            }
            put(:update, params: { id: notification.id, notification: params })
            notification.reload
            params.keys.each do |key|
               expect(notification.attributes[key.to_s]).to eq params[key]
            end
            expect(flash[:notice]).to eq 'News successfully updated.'
         end
      end
   
      context 'DELETE #destroy' do
         let!(:notification) { FactoryGirl.create(:notification) }
         it 'should delete an notification and display a success notice' do
            expect { delete :destroy, params: { id: notification.id } }.to change(Notification, :count).by(-1)
            expect(flash[:notice]).to eq 'News successfully removed.'
         end
      end
   end
end