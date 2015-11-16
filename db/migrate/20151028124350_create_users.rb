class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      
      t.boolean :available      , default:1     #계정 사용가능 여부
      t.integer :user_type_id   , default:1     #계정의 타입(권한 및 분류)
      
      #기본 유저 정보
      ## Database authenticatable
      t.string :email,                     null: false    #이메일
      t.string :password,                  null: false    #비밀번호
      t.string :school,                    default: ""  #학교
      t.text :intro,                     default: ""  #자기소개
      t.string :career,                    default: ""  #수상 및 경력
      t.string :name,                      null: false    #이름
      t.string :picture,                   default: ""  #프로필 사진
      t.string :phonenumber,               default: ""  #폰번호
      t.integer :organization_id,          default: 0  #소속기관
      t.string :confirm_password,          null: false #비밀번호확인
    #페이스북
      t.string :provider
      t.string :uid
      t.string :f_name
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.integer :authority_bundle_id, null: false, default: 1 #계정의 권한모음
      
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
