require 'link'

describe Link do

  subject(:link) { described_class.new }
  describe "::all" do
    it "returns a list of all links" do
      expect(described_class.all).to include ["http://google.com"]
      expect(described_class.all).to include ["http://facebook.com"]
    end
  end

  describe "::add_link" do
    it "adds a link to database" do
      described_class.add_link('http://www.runningoutofwebsites.com')
      expect(described_class.all).to include ["http://www.runningoutofwebsites.com"]
    end
    it "does not add an invalid link" do 
      described_class.add_link('www.frog')
      expect(described_class.all).not_to include ["www.frog"]
    end
  end
end
