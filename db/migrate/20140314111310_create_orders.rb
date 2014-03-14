class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.integer :room_id
      t.integer :user_id

      # required to use Stripe
      t.string :stripe_token
      

      t.timestamps
    end
  end
end
