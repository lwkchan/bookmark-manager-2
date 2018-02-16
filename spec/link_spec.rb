require 'link'

describe Link do

  describe "::all" do
    it "returns a list of all links" do
      links = Link.all
      urls = links.map(&:url)
      expect(urls).to include("http://www.google.com")
      expect(urls).to include("http://www.facebook.com")
    end
  end

  describe "::add_link" do
    it "adds a link to database" do
      described_class.add_link('http://www.runningoutofwebsites.com', 'Runningoutofwebsites')
      links = described_class.all
      urls = links.map(&:url)
      expect(urls).to include "http://www.runningoutofwebsites.com"
    end

    it "stored title in database" do
      described_class.add_link('http://www.runningoutofwebsites.com', 'Runningoutofwebsites')
      links = described_class.all
      titles = links.map(&:title)
      expect(titles).to include "Runningoutofwebsites"
    end

    it "does not add an invalid link" do
      described_class.add_link('www.frog', 'Frog')
      expect(described_class.all).not_to include "www.frog"
    end

  end

  describe "::delete" do
    it "deletes the bookmark by 'id'" do
      links = described_class.all
      fb_id = links.map(&:id).first
      described_class.delete(fb_id)
      links = described_class.all # refreshed link objects array
      remaining_ids = links.map(&:id)
      expect(remaining_ids).not_to include fb_id
    end
  end

  subject(:link) { described_class.new(1, 'http://www.google.com', 'Google') }

  describe '#url' do
    it 'holds a url as an attribute' do
      expect(link.url).to eq 'http://www.google.com'
    end
  end

  describe '#id' do
    it 'holds an id as an attribute' do
      expect(link.id.to_i).to be_kind_of Integer
    end
  end

  describe '#title' do
    it 'holds a title as an attribute' do
      expect(link.title).to eq 'Google'
    end
  end

end
