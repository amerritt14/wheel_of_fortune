require 'test_helper'

class GuessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guess = guesses(:one)
  end

  test "should get index" do
    get guesses_url
    assert_response :success
  end

  test "should get new" do
    get new_guess_url
    assert_response :success
  end

  test "should create guess" do
    assert_difference('Guess.count') do
      post guesses_url, params: { guess: {  } }
    end

    assert_redirected_to guess_url(Guess.last)
  end

  test "should show guess" do
    get guess_url(@guess)
    assert_response :success
  end

  test "should get edit" do
    get edit_guess_url(@guess)
    assert_response :success
  end

  test "should update guess" do
    patch guess_url(@guess), params: { guess: {  } }
    assert_redirected_to guess_url(@guess)
  end

  test "should destroy guess" do
    assert_difference('Guess.count', -1) do
      delete guess_url(@guess)
    end

    assert_redirected_to guesses_url
  end
end
