require 'rails_helper'

RSpec.describe ShopsController, type: :controller do 

  describe 'GET index' do
    before { get :index }

    context 'when products are present' do
      let!(:product) { create(:product) }

      it 'assigns products' do
        expect(assigns(:products)).to eq([product])
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it do
        expect(response).to have_http_status(:success)
      end
    end

    context 'when products are NOT present' do
      it 'assigns products' do
        expect(assigns(:products)).to eq([])
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET show' do
    before { get :show, params: params }
    let(:params) do
      { id: product.id }
    end
    let!(:product) { create(:product) }

    it 'assigns @product' do
      expect(assigns(:product)).to eq(product)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end
end