require "rails_helper"

describe Message do

  describe '#blacklisted?' do
    context 'message text is not blacklisted' do
      let(:message){FactoryGirl.build(:message)}

      it{ expect(message.blacklisted?).to be_falsey }
    end

    context 'message text is blacklisted' do
      let(:message){FactoryGirl.build(:message, :blacklisted)}

      it{ expect(message.blacklisted?).to be_truthy }
    end
  end

  describe '#check_blacklist' do
    subject { message.check_blacklist }
    let(:message){FactoryGirl.build(:message)}

    context 'message text is not blacklisted' do
      it "blacklist is false" do
        subject
        expect(message.blacklist).to be_falsey
      end

      it "blacklist text is nil" do
        subject
        expect(message.blacklist_text).to eq ""
      end
    end

    context 'message text is blacklisted' do
      before do
	message.text = 'mensagem proibida: faca'
      end

      it "blacklist is true" do
        subject
        expect(message.blacklist).to be_truthy
      end

      it "blacklist replace_words is called" do
        subject
        expect(message.blacklist_text).to eq('mensagem proibida: XXX')
      end
    end
  end

end
