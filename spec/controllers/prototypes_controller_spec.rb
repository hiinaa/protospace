require 'rails_helper'

describe PrototypesController do
   let!(:prototype) { create(:prototype) }
   let(:params) {{
     id: prototype.id,
     prototype: attributes_for(:prototype, title: 'hoge')
   }}
   let(:invalid_params) {{
     id: prototype.id,
     prototype: attributes_for(:prototype, title: nil)
   }}

  context 'with user login' do
    login_user

    describe 'GET #index' do
    before do
      get :index
    end
      it 'assigns the requested prototypes to @prototypes' do
        expect(assigns(:prototypes)).to include prototype
      end

      it 'render the :index template' do
        expect(response).to render_template :index
      end
    end

    describe 'GET #new' do
      before do
        get :new
      end
      it 'assignes the requested prototype to @prototype' do
        expect(assigns(:prototype)).to be_a_new(Prototype)
      end

      it 'render the :new template' do
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        before do
          post :create, params
        end
        it 'save the new prototype in the database' do
          expect { post :create, params }.to change(Prototype, :count).by(1)
        end

        it 'redirects to root_path' do
          expect(response).to redirect_to root_path
        end

        it 'shows flash messages to show save the prototype successfully' do
          expect(flash[:notice]).to eq 'Created successfully!'
        end
      end

      context 'with invalid attributes' do
      before do
        post :create, invalid_params
      end

        it 'does not save the new prototype in the database' do
          expect { post :create, invalid_params }.not_to change(Prototype, :count)
        end

        it 'redirects to new_prototypes_path' do
          expect(response).to redirect_to new_prototype_path
        end

        it 'shows flash messages to show save the prototype successfully' do
          expect(flash[:alert]).to eq 'Sorry, but something went wrong.'
        end
      end
    end

    describe 'GET #show' do
    before do
      get :show, id: prototype
    end

      it 'assigns the requested prototype to @prototype' do
        expect(assigns(:prototype)).to eq prototype
      end

      it 'assigns the requested comment to @comment' do
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it 'renders the :show template' do
        expect(response).to render_template :show
      end
    end

    describe 'GET #edit' do
    before do
      get :edit, id: prototype
    end

      it 'assigns the requested prototype to @prototype'do
        expect(assigns(:prototype)).to eq prototype
      end

      it 'renders the :edit template' do
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      before do
        patch :update, params
      end

      context 'with valid attributes' do
        it 'assigns the requested prototype to @prototype' do
          expect(assigns(:prototype)).to eq prototype
        end

        it 'updates attributes of prototype' do
          prototype.reload
          expect(prototype.title).to eq 'hoge'
        end

        it 'redirects to root_path' do
          expect(response).to redirect_to root_path
        end

        it 'shows flash message to show update prototype successfully' do
          expect(flash[:notice]).to eq 'Edited successfully!'
        end
      end

      context 'with invalid attributes' do
        before do
          patch :update, invalid_params
        end

        it 'assigns the requested prototype to @prototype' do
          expect(assigns(:prototype)).to eq prototype
        end

        it 'does not save the new prototype' do
          expect(prototype.title).not_to eq 'hoge'
        end

        it 'renders the :edit template' do
          expect(response).to redirect_to edit_prototype_path
        end

        it 'shows flash message to show update prototype unsuccessfully' do
          expect(flash[:alert]).to eq 'Please fill in the blanks'
        end
      end
    end

    describe 'DELETE #destroy' do

      it 'assigns the requested prototype to @prototype' do
        delete :destroy, id: prototype
        expect(assigns(:prototype)).to eq prototype
      end

      it 'delete prototype' do
        expect{ delete :destroy, id: prototype }.to change(Prototype, :count).by(-1)
      end

      it 'redirects to root_path' do
        delete :destroy, id: prototype
        expect(response).to redirect_to root_path
      end

      it 'shows flash message to show update prototype unsuccessfully' do
        delete :destroy, id: prototype
        expect(flash[:notice]).to eq 'Deleted successfully!'
      end
    end
  end

  context 'without user login' do
    describe 'GET #new' do
      it 'redirects sign_in page' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'POST #create' do
      it 'redirects sign_in page' do
        post :create
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'GET #edit' do
      it 'redirects sign_in page' do
        get :edit, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'PATCH #update' do
      it 'redirects sign_in page' do
        patch :update, id: prototype, prototype: attributes_for(:prototype)
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects sign_in page' do
        delete :destroy, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
 end
