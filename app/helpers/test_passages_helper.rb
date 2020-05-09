module TestPassagesHelper
  def test_result_message(test_passage)
    if test_passage.success?
      "<p class=\"result--success\">Test passed, your result: #{test_passage.percent}</p>".html_safe
    else
      "<p class=\"result--fail\">Test failed, your result: #{test_passage.percent}</p>".html_safe
    end
  end
end
