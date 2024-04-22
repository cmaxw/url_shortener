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
end
