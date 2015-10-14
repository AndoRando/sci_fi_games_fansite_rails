class Opinion < ActiveRecord::Base
  belongs_to :contribution
  validates_presence_of :title, :content, :contribution_id
end
