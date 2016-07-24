module UsersHelper
  def user_has_any_post(user)
    user.posts.count > 0
  end

  def user_has_any_comment(user)
    user.comments.count > 0
  end
end
