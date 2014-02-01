# ## Schema Information
#
# Table name: `domains`
#
# ### Columns
#
# Name                   | Type               | Attributes
# ---------------------- | ------------------ | ---------------------------
# **`id`**               | `integer`          | `not null, primary key`
# **`name`**             | `string(255)`      | `not null`
# **`master`**           | `string(128)`      |
# **`last_check`**       | `integer`          |
# **`type`**             | `string(6)`        | `not null`
# **`notified_serial`**  | `integer`          |
# **`account`**          | `string(40)`       |
#
# ### Indexes
#
# * `index_domains_on_name` (_unique_):
#     * **`name`**
#

class Domain < ActiveRecord::Base
  include PDNS
  include DomainNameValidation

  has_many :records
end
