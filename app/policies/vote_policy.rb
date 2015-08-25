class VotePolicy < ApplicationPolicy
  def update?
    user.present?
  end
end