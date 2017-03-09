class GroupStat < ApplicationRecord
  has_one :age_cluster, dependent: :destroy
  belongs_to :group
  has_many :group_posts, dependent: :nullify
end
