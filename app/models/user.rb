class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :tests
	has_many :solutions, through: :tests
	has_many :collaborations
	has_many :collaborators, through: :collaborations
	has_many :inverse_collaborations, class_name: "Collaboration", foreign_key: "collaborator_id"
	has_many :inverse_collaborators, through: :inverse_collaborations, source: :user

	def collaborating_with(x)
		self.collaborators.find { |c| c.id == x }
	end

end