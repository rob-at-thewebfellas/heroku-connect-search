ThinkingSphinx::Index.define 'salesforce/organisation_b/contact', with: :active_record do

  indexes department
  indexes email
  indexes firstname, as: :first_name
  indexes lastname, as: :last_name
  indexes title

  indexes [ lastname, firstname ], as: :name, sortable: true

  where sanitize_sql([ 'isdeleted = ?', false ])

end
