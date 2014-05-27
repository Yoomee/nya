class ContactEnquiry

  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_reader :email, :message, :name

  validates :email, :message, :name, presence: true
  validates :email, email: true

  def initialize(args={})
    @email = args[:email]
    @message = args[:message]
    @name = args[:name]
  end

  def deliver
    true
  end

  def persisted?
    false
  end

end
