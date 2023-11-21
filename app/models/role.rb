# == Schema Information
#
# Table name: roles
#
#  id           :bigint           not null, primary key
#  access_level :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  company_id   :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_roles_on_company_id  (company_id)
#  index_roles_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (user_id => users.id)
#
class Role < ApplicationRecord
  belongs_to :user
  belongs_to :company

  enum access_level: %i[auditor guest ex_employee employee accountant hr admin]
end
