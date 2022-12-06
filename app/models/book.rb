# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :csv

  attribute :uuid, MySQLBinUUID::Type.new

  UUID_REGEX = /\A[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}\z/i

  validates :uuid,  presence: true,
                    format: { with: UUID_REGEX, message: 'Invalid UUID' },
                    uniqueness: { scope: :csv_id, case_sensitive: false }
  validates :title, presence: true
end
