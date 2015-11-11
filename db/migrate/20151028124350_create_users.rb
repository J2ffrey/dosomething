class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      
      t.boolean :available,  default:0
      t.integer :user_type_id, default:0
      
      #내가 추가한것들
      t.string :name,                      null: false, default:""
      t.string :picture,                                default:""
      t.string :phonenumber,               null: false, default:""
      t.integer :organization_id,                       default:0
      
      t.integer :authority_bundle_id, null: false, default:1
      
      ## Database authenticatable
      t.string :email,                     null: false, default: ""
      t.string :password,                  null: false, default: ""
      t.string :confirm_password           null: false, default: ""
      ## Trackable
      t.integer  :sign_in_count,           null: false, default: 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      
      t.timestamps null: false
    end
  end
end
