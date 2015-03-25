class Init < ActiveRecord::Migration
  def change
    create_table :effects do |t|
      t.string :title

      t.timestamps
    end
  end

  create_table :specials do |t|
      t.string :title
      t.text :description
      t.integer :price

      t.timestamps
    end

    create_table :installs do |t|
      t.string :area
      t.text :description
      
      t.timestamps
    end

    create_table :classifications do |t|
      t.string :title

      
      t.timestamps
    end

    create_table :items do |t|
      t.string :title
      t.string :model_number
      t.text :standard
      
      t.timestamps
    end


end
