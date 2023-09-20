# ApplicationRecord is the base class for all models in the application.
# It extends ActiveRecord::Base and provides common functionality and
# configuration for models.
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
