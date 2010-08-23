class Flags < ActiveRecord::Base
  has_attachment :storage => :s3
end
