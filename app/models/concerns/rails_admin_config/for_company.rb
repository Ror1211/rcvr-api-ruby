module RailsAdminConfig
  module ForCompany
    extend ActiveSupport::Concern

    included do
      rails_admin do
        fields :id, :name, :created_at, :areas, :owner, :tickets, :menu_link, :is_free
      end
    end
  end
end
