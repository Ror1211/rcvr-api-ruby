module RailsAdminConfig
  module ForOwner
    extend ActiveSupport::Concern

    included do
      rails_admin do
        fields :id, :email, :created_at, :name, :companies, :affiliate, :can_use_for_free, :trial_ends_at, :block_at, :frontend

        fields :stripe_subscription_id, :stripe_customer_id do
          read_only true
        end

        list do
          scopes [:all, :affiliate]
        end
      end
    end
  end
end
