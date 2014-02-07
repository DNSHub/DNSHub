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

  has_many :records

  validates :name,
    presence: true,
    domain: true

  validates :type,
    presence: true,
    inclusion: { in: ["NATIVE", "MASTER", "SLAVE"] }

  validates :master,
    presence: true,
    format: { with: /\A([0-9]+\.){3}[0-9]+\z/, message: "must an ip" }, # TODO: translate
    if: ->(domain) { domain.type == "SLAVE" }
end
