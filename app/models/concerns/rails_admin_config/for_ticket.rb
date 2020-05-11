module RailsAdminConfig
  module ForTicket
    extend ActiveSupport::Concern

    included do
      rails_admin do
        fields :id, :entered_at, :left_at, :area
      end
    end
  end
end