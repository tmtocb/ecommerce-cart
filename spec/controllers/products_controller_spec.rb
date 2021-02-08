require 'rails_helper'

RSpec.describe ProductsController, type: :controller do 

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

  describe 'GET new' do
    before { get :new }

    it 'assigns product' do
      expect(assigns(:product)).to be_a_new(Product)
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end

    it do
      expect(response).to have_http_status(200)
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

  describe 'GET edit' do
    subject { get :edit, params: params }
    let(:params) do
      { id: product.id }
    end
    let!(:product) { create(:product) }

    it 'assigns @product' do
      subject
      expect(assigns(:product)).to eq(product)
    end

    it 'renders the edit template' do
      subject
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST create' do
    subject { post :create, params: params }

    context 'valid params' do
      let(:params) do
        { product: { title: 'Plane', price: '1.59' } }
      end

      it 'creates new product' do
        expect { subject }.to change(Product, :count).from(0).to(1)
      end

      it do
        subject
        expect(response).to have_http_status(302)
      end
    end

    context 'invalid params' do
      let(:params) do
        { product: { title: '' } }
      end

      it 'does not create new product' do
        expect { subject }.not_to change(Product, :count)
      end

      it do
        subject
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT update' do
    subject { put :update, params: params }
    let!(:product) { create(:product, title: 'Plane', price: '3.33') }

    context 'valid params' do
      let(:params) do
        { id: product.id, product: { title: 'Boat', price: '5.53' } }
      end

      it 'updates product' do
        expect { subject }
          .to change { product.reload.title }
          .from('Plane')
          .to('Boat')
          .and change { product.reload.price }
          .from(3.33)
          .to(5.53)
      end
    end

    context 'invalid params' do
      let(:params) do
        { id: product.id, product: { title: '' } }
      end

      it 'does not update product' do
        expect { subject }.not_to change { product.reload.title }
      end
    end
  end

  describe 'DELETE destroy' do
    subject { delete :destroy, params: params }
    let!(:product) { create(:product) }

    context 'valid params' do
      let(:params) do
        { id: product.id }
      end

      it 'deletes product' do
        expect { subject }.to change(Product, :count).from(1).to(0)
      end
    end
  end
end
 

