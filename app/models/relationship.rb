class Relationship < ApplicationRecord
  # このままではfollowersテーブルを参照しにいってしまうため、class_nameとすることで正しくusersテーブルを参照します。
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
