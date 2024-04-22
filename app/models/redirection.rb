# == Schema Information
#
# Table name: redirections
#
#  id              :bigint           not null, primary key
#  destination_url :string
#  source_path     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Redirection < ApplicationRecord
  validates :source_path, presence: true, uniqueness: true, length: { in: 2..8 }
  validates :destination_url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }

  before_validation :generate_source_path

  def generate_source_path
    return if source_path.present?

    self.source_path = SecureRandom.alphanumeric(8) while source_path.blank? || Redirection.exists?(source_path:)
  end
end
