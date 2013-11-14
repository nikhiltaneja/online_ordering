require './test/test_helper'

class ArticleCreationTest < Capybara::Rails::TestCase
  def test_it_creates_an_article_with_a_title_and_body

    puts "RUNNING THE TEST"
    visit '/categories'

    click_on 'Add to Cart'

    assert page.has_content?("Added")   

  end
end

