class AgencyPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      # Anyone can view any agency
      scope.all

      # Display only restaurants of owner
      # scope.where(user: user)
    end
  end

  # def new? #--> new not necessary as it is calling on create..
  #   return true  # Anyone can create an Agency
  # end

  def create?
    return true  # Anyone can create an Agency
  end

  def update?
    # rule?
    # if agency was created by me => true
    # else => false
    #   user => current_user from Devise
    #   record => @agency
    user_is_owner?
  end

  def destroy?
    # 1. only an admin
    # 2. only the user who created the agency record
    user_is_owner?
  end

  private

  def user_is_owner?
    record.user == user
  end

end
