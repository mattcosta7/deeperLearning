class Completion < ActiveRecord::Base

    belongs_to :completed, class_name: "Challenge"
    belongs_to :completer, class_name: 'User'

    validates :completed_id, uniqueness: {scope: :completer_id}
    validates :completer_id, uniqueness: {scope: :completed_id}
end

#completion table has completers and completeds through challenges
# and users, unique in both regards