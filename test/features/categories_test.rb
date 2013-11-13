require './test/test_helper'

class ArticleCreationTest < MiniTest::Unit::TestCase

  def test_it_creates_an_article_with_a_title_and_body
    visit '/categories'

    click_on 'Add to Cart'

    assert page.has_content?("Added")   

  end

end

