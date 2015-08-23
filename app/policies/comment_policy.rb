class CommentPolicy < ApplicationPolicy
  def destroy?
    user.present? && (user.admin? || user.moderate? || record.user == user)
  end
end