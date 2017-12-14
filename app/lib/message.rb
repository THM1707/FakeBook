class Message
  def self.not_found(record = 'record')
    "Sorry, #{record} not found."
  end

  def self.invalid_credentials
    'Invalid credentials'
  end

  def self.invalid_token
    'Invalid token'
  end

  def self.missing_token
    'Missing token'
  end

  def self.unauthorized
    'Unauthorized request'
  end

  def self.account_created
    'Account created successfully'
  end

  def self.login_success
    'Login successfully'
  end

  def self.account_not_created
    'Account could not be created'
  end

  def self.expired_token
    'Sorry, your token has expired. Please login to continue.'
  end

  def self.category_created
    'Category created successfully '
  end

  def self.category_updated
    'Category updated successfully '
  end

  def self.category_deleted
    'Category deleted'
  end

  def self.page_created
    'Page created successfully'
  end

  def self.page_deleted
    'Page deleted'
  end

  def self.page_updated
    'Page updated successfully '
  end

  def self.not_admin
    'Only admin can do this'
  end

  def self.saved
    'Saved'
  end

  def self.unsaved
    'Unsaved'
  end
end