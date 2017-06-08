class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    return true  # Anyone can view a user
  end

  def create?
    return true  # Anyone can create a user
  end

  def update?
    record == user  # Only user creator can update a user
    # - record: the user passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record == user  # Only user creator can delete a user
  end

  def edit?
    record == user  # Only user creator can edit a user
  end
end
