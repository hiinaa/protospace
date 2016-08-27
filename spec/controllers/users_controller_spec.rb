require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }

  context 'with user login' do
    login_user

      describe 'GET #show' do
        before do
          get :show, id: user
        end

        it 'assigns the requested to @user' do
          expect(assigns(:user)).to eq user
        end

        it 'renders the :show tempates' do
          expect(response).to render_template :show
        end
      end

      describe 'GET #edit' do
        before do
          get :edit, id: user
        end

        it 'assigns the requested to @user' do
          expect(assigns(:user)).to eq user
        end

        it 'renders the :edit tempates' do
          expect(response).to render_template :edit
        end
      end

      describe 'PATCH #update' do
        before do
          patch :update, id: user, user: attributes_for(:user)
        end

        it 'assigns the requested user to @user' do
          patch :update, id: user, user: attributes_for(:user)
          expect(assigns(:user)).to eq user
        end

        it "change @user's attributes" do
          user = build_stubbed(:user,
            nickname: "hoge"
            )
          expect(user.nickname).to eq "hoge"
        end

        it 'redirects root path' do
          expect(response).to redirect_to root_path
        end

        it 'sends flash messages' do
          expect(flash[:notice]).to eq 'Updated successfully'
        end
      end
  end

  context 'without user login' do
    let(:user){ create(:user) }

    describe 'GET #edit' do

      it 'redirects sign_in page' do
        get :edit, id: user
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'PATCH #update' do

      it 'redirects sign_in page' do
        patch :update, id: user,
        user: attributes_for(:user, nickname: 'notvalid')
        user.reload
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
