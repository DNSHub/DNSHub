class CreateRecords < ActiveRecord::Migration
  def change
    config = Rails.configuration.database_configuration

    if config["pdns_#{Rails.env}"]["migrate"]
      Domains.connection.create_table :records do |t|
        t.references :domain
        t.string :name, limit: 255
        t.string :type, imit: 10
        t.string :content, limit: 65535
        t.integer :ttl
        t.integer :prio
        t.integer :change_date

        t.index :name
        t.index [:name, :type]
        t.index :domain_id
      end
    end
  end
end
