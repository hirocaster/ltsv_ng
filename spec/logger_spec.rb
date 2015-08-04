require_relative "spec_helper"

describe "LtsvNg::Logger" do
  before do
    @output = StringIO.new
    @logger = LtsvNg::Logger.new(@output)
  end

  describe "#formatter" do
    it "returns Logger::LtsvNg::Formatter" do
      expect(@logger.formatter).to be_an_instance_of(LtsvNg::Formatter)
    end
  end

  describe "#info" do
    it "returns info log by String Text" do
      @logger.info("Test")

      @output.seek(0)
      ltsv = @output.read.strip.split("\t")
      expect(ltsv).to include("level:INFO")
      expect(ltsv).to include("msg:Test")
    end

    it "returns info log by Hash" do
      @logger.info(id: 123, name: "foobar")
      @output.seek(0)
      ltsv = @output.read.strip.split("\t")
      expect(ltsv).to include("level:INFO")
      expect(ltsv).to include("id:123")
      expect(ltsv).to include("name:foobar")
    end
  end
end
