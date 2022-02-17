PASSWORD_FORMAT = /\A
  (?=.{8,})          # Must contain 8 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
/x
#  (?=.*[[:^alnum:]]) # Must contain a symbol

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :validatable
    has_secure_password
###  has_and_belongs_to_many :groups, join_table: "group_compositions" 
###  has_many :room_rights, class_name: "RoomUserRight"

  validates :name, presence: true
  validates :password, presence: true, format: { with: PASSWORD_FORMAT }, confirmation: true, on: :create
  #before_create :generate_authentication_token

  scope :pupils, -> {where("admin=false AND teacher=false AND questioner=false")}
  scope :staff, -> {where("teacher=true OR questioner=true")}
  scope :teachers, -> {where("teacher=true")}
  scope :questioners, -> {where("questioner=true")}

  def fullname
      (self.firstname.to_s+" "+self.name.to_s).strip
  end
  def viewable_rooms
      if self.admin
          return Room.all
      elsif self.is_pupil?
          return Room.where("id IN (SELECT DISTINCT room_id FROM room_group_rights WHERE group_id IN (SELECT groups.id FROM groups JOIN group_compositions ON groups.id=group_compositions.group_id WHERE user_id=?))",self.id)
      else
          coll=room_rights.select{|rr| rr.view}.map{|rr| Room.find(rr.room_id)}
          if self.teacher
              coll+= Room.where("for_teachers=true").to_a
          end
          if self.questioner
              coll+= Room.where("for_questioners=true").to_a
          end
          return coll
      end
  end
  def editable_rooms
      if self.admin
          return Room.all
      elsif self.is_pupil?
          return []
      else
          coll=room_rights.select{|rr| rr.view}.map{|rr| Room.find(rr.room_id)}
          if self.teacher
              coll+= Room.where("for_teachers=true").to_a
          end
          if self.questioner
              coll+= Room.where("for_questioners=true").to_a
          end
          return coll
      end
  end
  private
  def is_pupil?
      !(self.admin || self.teacher || self.questioner)
  end
def generate_authentication_token
    loop do
      self.auth_token = SecureRandom.base64(64)
      break unless User.find_by(auth_token: auth_token)
    end
  end
end
