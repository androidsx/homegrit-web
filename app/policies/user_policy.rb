class UserPolicy < ApplicationPolicy

  # We have access to @user (current_user) and @record (current model)
  def index?
    @user.admin?
  end

  def show?
    @user.admin? or @user == @record
  end

  def update?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end

end