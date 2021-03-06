shared_examples_for 'an Active Record matcher' do
  let(:matcher_name) { self.class.parent.parent.description }

  def self.with_option(option_name, positive, negative)
    context "with option #{option_name.inspect}" do
      let(:options) { [:company, option_name => positive] }

      before(:each) { model.send(macro, *options) }

      it 'matches if the options match' do
        should send(matcher_name, :company, option_name => positive)
      end

      it "doesn't match if the options don't match" do
        should_not send(matcher_name, :company, option_name => negative)
      end
    end
  end

  def self.with_unsupported_option(option_name, value=nil)
    context "with unsupported option #{option_name.inspect}" do
      it 'raises an error' do
        expect {
          send(matcher_name, :company, option_name => value)
        }.to raise_error(ArgumentError, /unsupported.*:#{option_name}/i)
      end
    end
  end

  context 'failure messages' do
    let(:matcher) { send(matcher_name, *options) }

    before(:each) { matcher.matches?(subject) }

    it 'has a custom failure message' do
      matcher.failure_message.should ==
        "Expected #{subject.class.name} to #{matcher.description}"
    end

    it 'sets a custom negative failure message' do
      matcher.negative_failure_message.should ==
        "Did not expect #{subject.class.name} to #{matcher.description}"
    end
  end

  context "with an unknown option" do
    it 'raises an error' do
      expect {
        send(matcher_name, :xxx => true)
      }.to raise_error(ArgumentError, /unknown.*:xxx/i)
    end
  end
end
