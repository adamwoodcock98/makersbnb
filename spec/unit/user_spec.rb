require 'user'

describe User do
  before do
    described_class.create(
      first_name: 'Bruce',
      last_name: 'Wayne',
      user_name: 'TheBatman',
      email: 'bats@example.com',
      password: 'TheJokerSmells',
    )
  end

  describe '.authenticate' do
    context 'when given correct email' do
      context 'and correct password' do
        it 'returns a User object' do
          expect(described_class.authenticate(email: 'bats@example.com', password: 'TheJokerSmells')).not_to be_nil
        end
      end
      context 'and incorrect password' do
        it 'returns nil' do
          expect(described_class.authenticate(email: 'bats@example.com', password: 'JingleBells')).to be_nil
        end
      end
    end
    context 'when given incorrect email' do
      it 'returns nil' do
        expect(described_class.authenticate(email: 'robin@example.com', password: 'TheJokerSmells')).to be_nil
      end
    end
  end
end