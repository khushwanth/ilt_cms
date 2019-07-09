require 'rails_helper'

RSpec.describe EventsController, type: :controller do
   describe 'Event controller request specs' do
      login_user
  
      context 'GET #index' do 
         it 'should success and render to index page' do
            get :index
            expect(response).to have_http_status(200)
            expect(response).to render_template :index
         end
      end

      context 'GET #show' do
         let!(:event) { FactoryGirl.create(:event) }
         it 'should display the details of a particular event' do
            get :show, params: { id: event.id }
            expect(response).to have_http_status(200)
            expect(response).to render_template :show
         end
      end

      context 'POST #create' do
         it 'should create an event and display a success notice' do
            params =   {
               title: 'Test Event',
               event_date: Date.today,
               start_time: Time.now,
               end_time: Time.now,
               venue: 'Babesa'
            }
            expect { post(:create, params: { event: params }) }.to change(Event, :count).by(1)
            expect(flash[:notice]).to eq 'Event was successfully created.'
         end
      end

      context 'PUT #update' do
         let!(:event) { FactoryGirl.create(:event) }
         it 'should update an existing event and display a success notice' do
            params = {
               title: 'Test Event Updated',
               venue: 'TTPL'
            }
            put(:update, params: { id: event.id, event: params })
            event.reload
            params.keys.each do |key|
               expect(event.attributes[key.to_s]).to eq params[key]
            end
            expect(flash[:notice]).to eq 'Event was successfully updated.'
         end
      end
   
      context 'DELETE #destroy' do
         let!(:event) { FactoryGirl.create(:event) }
         it 'should delete an event and display a success notice' do
            expect { delete :destroy, params: { id: event.id } }.to change(Event, :count).by(-1)
            expect(flash[:notice]).to eq 'Event was successfully removed.'
         end
      end
   end
end