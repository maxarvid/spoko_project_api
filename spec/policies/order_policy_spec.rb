describe OrderPolicy do
  subject { described_class.new(user, order) }

  let(:order) { Order.create }
  
  describe 'being a registered user' do
    let(:user) { create(:user) }
    it { is_expected.to permit_actions(:create) }
  end

  describe 'being a visitor' do
    let(:user) { create(:user, role: 1) }
    it { is_expected.to forbid_action(:create) }
  end

  describe 'being an admin' do
    let(:user) { create(:user, role: :admin) }
    it { is_expected.to permit_actions(:create) }
  end


end
