class Bug < ActiveRecord::Base
  belongs_to :patch
  belongs_to :user
  belongs_to :tester, class_name: "User"
  belongs_to :bug_type
end
