class PostPolicy < ApplicationPolicy
  def destroy?
    user.present? && (user.moderator? || user.admin? || record.user == user)
  end
end