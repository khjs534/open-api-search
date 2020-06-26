require 'rails_helper'

describe "thefts", :type => :request do

  let!(:lone_theft) { FactoryBot.create(:theft)}
  let!(:thefts) { FactoryBot.create_list(:theft, 20) }

  context '#index' do

    before { get '/api/v1/thefts' }

    it 'returns all thefts' do
      expect(JSON.parse(response.body).size).to eq(21)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  context '#show' do
    context 'with valid id' do
      before { get "/api/v1/thefts/#{lone_theft.id}"}

      it 'returns the lone theft' do
        expect(JSON.parse(response.body)['id']).to eq(lone_theft.id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid id' do
      before { get "/api/v1/thefts/99999"}
      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  context '#create' do
    context 'with valid params' do
      params = { theft: { title: Faker::Lorem.name, description: Faker::Lorem.sentence, address: Faker::Address.street_address, source_url: Faker::Internet.url, image_url: Faker::Internet.url } }

      before { post "/api/v1/thefts/", params: params }

      it 'returns the correct theft' do
        body = JSON.parse(response.body)
        expect(body['title']).to eq(params[:theft][:title])
        expect(body['description']).to eq(params[:theft][:description])
        expect(body['address']).to eq(params[:theft][:address])
        expect(body['source_url']).to eq(params[:theft][:source_url])
        expect(body['image_url']).to eq(params[:theft][:image_url])
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      before do
        params = {theft: {title: nil, description: nil} }
        post "/api/v1/thefts/", params: params
      end

      it 'returns an unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  context '#update' do
    before do
      @theft = FactoryBot.create(:theft)
    end
    context 'with valid params' do
      params = { theft: { title: Faker::Lorem.name } }
      before { put "/api/v1/thefts/#{@theft.id}", params: params }

      it 'updates attribures for theft' do
        expect(Theft.find(@theft.id).title).to eq(params[:theft][:title])
      end

      it 'returns accepted status' do
        expect(response).to have_http_status(:accepted)
      end
    end

    context 'with invalid params' do
      params = { theft: {title: nil } }
      before { put "/api/v1/thefts/#{@theft.id}", params: params}

      it 'returns an unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  context '#destroy' do
    context 'with valid id' do
      before { delete "/api/v1/thefts/#{lone_theft.id}" }

      it 'deletes the theft' do
        # 21 thefts before delete
        get '/api/v1/thefts'
        expect(JSON.parse(response.body).size).to eq(20)
      end

      it 'returns a no content status' do
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'with invalid id' do
      before { delete "/api/v1/thefts/99999"}
      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
