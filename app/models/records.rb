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

class Records < ActiveRecord::Base
  include PDNS
  include DomainNameValidation

  belongs_to :domain
end
