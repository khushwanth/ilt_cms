class EventPolicy < ApplicationPolicy
    def index?
        true
    end

    def create?
        user.admin?
    end
 
    def update?
        user.admin?
    end

    def destroy?
       user.admin?
    end

    private

        def event
            record
        end

    class Scope < Scope
        def resolve
            scope.all
        end
    end
end