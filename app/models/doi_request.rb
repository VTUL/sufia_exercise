class DoiRequest < ApplicationRecord
  # non-empty /string/ asset_type, one of "Collection" or "Item"
  validates :asset_type, presence: true
  validates :asset_type, inclusion: { in: %w{Collection Item}}

  # non-empty /string/ asset_id unique within scope of asset_type
  validate :asset_id, uniqueness: { scope: :asset_type,
    message: "asset_id must be unique within a given asset_type"}

  validates :doi, presence: true
  validates :doi, uniqueness: true,
    unless: Proc.new { |rec| 'doi:pending' == rec }

  validates :created_at, presence: true
  validates :updated_at, presence: true

end
