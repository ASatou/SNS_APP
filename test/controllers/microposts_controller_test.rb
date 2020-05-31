require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @micropost = microposts(:orange)
  end
  
  test "should redirect create when not login" do
    assert_no_difference 'Micropost.count', 1 do
      post microposts_path, params: { micropost: { coment: "hogehoge" } }
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy when not login" do
    assert_no_difference 'Micropost.count', -1 do
      delete micropost_path(@micropost)
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy for wrong micropost" do
    log_in_as users(:michael)
    micropost = microposts(:ants)
    assert_no_difference 'Micropost.count' do
      delete micropost_path(micropost)
    end
    assert_redirected_to microposts_url
  end
  
end
