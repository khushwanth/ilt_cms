class NotificationPolicy < ApplicationPolicy
    def index?
        true
    end

    def create?
        user.admin?
    end

    def update?
        return true if current_user.admin
    end

    def destroy?
        return true if current_user.admin
    end

    private

        def notification
            record
        end
end