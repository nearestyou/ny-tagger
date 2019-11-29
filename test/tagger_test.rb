require 'minitest/autorun'
load 'lib/ny-tagger.rb'

class NYTaggerTest < MiniTest::Test
  def test_google
    assert NYTagger.determine_premises_type({location_type: 'grocery_store'}) == :off
    assert NYTagger.determine_premises_type({location_type: 'brewpub'}) == :both
    assert NYTagger.determine_premises_type({location_type: 'restaurant'}) == :on
  end
end
