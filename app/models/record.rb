# ## Schema Information
#
# Table name: `records`
#
# ### Columns
#
# Name               | Type               | Attributes
# ------------------ | ------------------ | ---------------------------
# **`id`**           | `integer`          | `not null, primary key`
# **`domain_id`**    | `integer`          |
# **`name`**         | `string(255)`      |
# **`type`**         | `string(255)`      |
# **`content`**      | `string(65535)`    |
# **`ttl`**          | `integer`          |
# **`prio`**         | `integer`          |
# **`change_date`**  | `integer`          |
#
# ### Indexes
#
# * `index_records_on_domain_id`:
#     * **`domain_id`**
# * `index_records_on_name`:
#     * **`name`**
# * `index_records_on_name_and_type`:
#     * **`name`**
#     * **`type`**
#

class Record < ActiveRecord::Base
  include PDNS
  include DomainNameValidation
  include RecordTypeValidation

  belongs_to :domain

  validates :content,
    presence:true

  def record_type?(type)
    self.type == type.to_s.upcase
  end
end
