# frozen_string_literal: true

module ApplicationHelper
  def correct_user?(user)
    user == current_user
  end

  def current_user_is_admin?
    user_signed_in? && current_user.admin
  end
end
