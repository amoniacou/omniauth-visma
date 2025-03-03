# frozen_string_literal: true

describe OmniAuth::Strategies::VismaEaccounting do
  subject do
    strategy = described_class.new(nil, options)
    allow(strategy).to receive(:session).and_return({})
    strategy
  end

  let(:options) { {} }
  let(:client) { subject.client }

  it_behaves_like 'an oauth2 strategy'

  describe '#client' do
    it 'has the correct Visma site' do
      expect(client.site).to eq('https://eaccountingapi.vismaonline.com/v2/')
    end

    it 'has the correct authorization url' do
      expect(client.options[:authorize_url]).to eq('https://identity.vismaonline.com/connect/authorize')
    end

    it 'has the correct token url' do
      expect(client.options[:token_url]).to eq('https://identity.vismaonline.com/connect/token')
    end
  end

  describe '#options' do
    it 'has correct authorize options' do
      expect(subject.options[:authorize_options]).to eq(%i[prompt acr_values state redirect_uri scope])
    end
  end

  describe '#callback_path' do
    it 'has the correct callback path' do
      expect(subject.callback_path).to eq('/auth/vismaeaccounting/callback')
    end
  end
end
