require 'rails_helper'

RSpec.describe 'HomeController', type: :request do
  describe 'GET /' do
    context 'when user is authenticated but missing an address' do
      before do
        @user = FactoryBot.create(:user, :with_basic_info)
        sign_in @user
      end

      it 'should redirect to new address form' do
        get '/'
        expect(response).to redirect_to new_user_address_path(@user)
      end
    end

    context 'when user is not authenticated' do
      it 'should show the home page' do
        get '/'
        expect(response.body).to include 'Hello world'
      end
    end
  end
end
