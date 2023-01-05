# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')

    assert_equal 'foo@example.com', user.name_or_email

    user.name = 'Foo Bar'
    assert_equal 'Foo Bar', user.name_or_email
  end

  test '#follow' do
    alice = users(:Alice)
    bob = users(:Bob)

    assert_not alice.following?(bob)
    alice.follow(bob)
    assert alice.following?(bob)
  end

  test '#unfollow' do
    alice = users(:Alice)
    bob = users(:Bob)

    assert_not alice.following?(bob)
    alice.follow(bob)
    alice.unfollow(bob)
    assert_not alice.following?(bob)
  end

  test '#following?' do
    alice = users(:Alice)
    bob = users(:Bob)

    assert_not alice.following?(bob)
    alice.follow(bob)
    assert alice.following?(bob)
  end

  test '#followed_by?' do
    alice = users(:Alice)
    bob = users(:Bob)

    assert_not alice.following?(bob)
    alice.follow(bob)
    assert bob.followed_by?(alice)
  end
end
