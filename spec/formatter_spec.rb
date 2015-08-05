require_relative "spec_helper"

describe "LtsvNg::Formatter" do
  let(:time) { Time.now }
  let(:formatter) { LtsvNg::Formatter.new }

  before(:each) { allow(SecureRandom).to receive(:uuid).and_return("b746d58e-e4c0-4f2b-86fd-f8ff78131745") }

  describe "#call" do
    context "String data log" do
      it "returns LTSV Format text" do
        text =  formatter.call("INFO", time, nil, "foobar")
        expect(text).to eq "level:INFO\ttime:#{time}\tuuid:b746d58e-e4c0-4f2b-86fd-f8ff78131745\tmsg:foobar\n"
      end
    end

    context "Hash data log" do
      it "returns LTSV Format text" do
        text =  formatter.call("INFO", time, nil, { id: 123, name: "foobar"})
        expect(text).to eq "level:INFO\ttime:#{time}\tuuid:b746d58e-e4c0-4f2b-86fd-f8ff78131745\tid:123\tname:foobar\n"
      end
    end
  end
end
