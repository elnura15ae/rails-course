require 'rails_helper'
require 'rails-controller-testing'
require 'pry'
# frozen_string_literal: true

RSpec.describe ItemsController, type: :controller do 
    render_views 

    let(:items) { create_list :item, 5 }
    let(:item) { create :item }

    let(:items_params) do
        { 
            item: { 
                name: 'car',
                price: 50,
                description: 'black'
             }
         }
    end


    context 'GET #index' do 
        before { get :index }

        it 'returns items' do
            is_expected.to render_template :index
            expect(assigns('key :items'))
        end 
    end



    context 'Post #create' do 
        subject { post :create, params: items_params} 

        it 'saves the item' do
        expect {subject}.to change(Item, :count).by(1)
        end 

        it 'redirect to index' do
            redirect_to action: :index
        end     

        context 'with invalid params' do
            let(:items_params) do 
                { item: {price: -20} }
            end
            it 'doesnt save' do 
                expect{subject}
            end 

            it 'render new templete' do 
                render_template :new
            end 
        end
    end


    context 'DELETE #destroy' do
        subject {delete :destroy, params: params}
        let(:params) { { id: item.id } }
        end 

        it 'deletes from Item' do
            item.reload
            expect{ subject }.to change(Item, :count).by(-1)
        end 
       
        it 'redirect index templete' do
          redirect_to action: :index
        end 
end
