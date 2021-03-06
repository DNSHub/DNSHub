class CreateDomains < ActiveRecord::Migration
  def change
    config = Rails.configuration.database_configuration

    if config["pdns_#{Rails.env}"]["migrate"]
      Domain.connection.create_table :domains do |t|
        t.string :name, limit: 255, null: false
        t.string :master, limit: 128, default: nil
        t.integer :last_check, default: nil
        t.string :type, limit: 6, null: false
        t.integer :notified_serial, default: nil
        t.string :account, limit: 40, default: nil

        t.index(:name, unique: true)
      end
    end
  end
end
