class UserSkillPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    return true # Anyone can view a project
  end

  def create?
    record.user == user # Anyone can create a project
  end

  def new?
    true
  end

  def update?
    record.user == user # Only project creator can update a project
    # - record: the project passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user  # Only project creator can delete a project
  end

  def edit?
    record.user == user  # Only project creator can edit a project
  end
end
