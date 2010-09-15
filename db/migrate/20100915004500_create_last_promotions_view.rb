class CreateLastPromotionsView < ActiveRecord::Migration
  def self.up
    execute "CREATE VIEW last_promotions AS
             SELECT promotions.* 
             FROM promotions 
             WHERE promotions.time = 
               (SELECT MAX(t.time) 
                FROM promotions t 
                WHERE t.member_id = promotions.member_id 
                GROUP BY t.member_id);"
  end

  def self.down
    execute "DROP VIEW last_promotions;"
  end
end
