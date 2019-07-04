class NotificationPolicy < ApplicationPolicy
    def index?
        true
    end

    def create?
       return true if user.admin
    end
 
    def update?
        return true if user.admin
    end

   def destroy?
       return true if user.admin
    end

    private

        def notification
            record
        end

    class Scope < Scope
        def resolve
            scope.all
        end
    end
end