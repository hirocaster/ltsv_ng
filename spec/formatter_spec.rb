require_relative "spec_helper"

describe "LtsvNg::Formatter" do
  let(:time) { Time.now }
  let(:formatter) { LtsvNg::Formatter.new }

  describe "#call" do
    context "String data log" do
      it "returns LTSV Format text" do
        text =  formatter.call("INFO", time, nil, "foobar")
        expect(text).to eq "level:INFO\ttime:#{time}\tmsg:foobar\n"
      end
    end

    context "Hash data log" do
      it "returns LTSV Format text" do
        text =  formatter.call("INFO", time, nil, { id: 123, name: "foobar"})
        expect(text).to eq "level:INFO\ttime:#{time}\tid:123\tname:foobar\n"
      end
    end
  end
end
