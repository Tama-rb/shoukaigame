require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "トップページの表示" do
    get root_path
    assert_response :success
  end
end
