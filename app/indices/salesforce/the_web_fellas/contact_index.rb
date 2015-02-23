ThinkingSphinx::Index.define 'salesforce/the_web_fellas/contact', with: :active_record do

  indexes email
  indexes firstname, as: :first_name, sortable: true
  indexes lastname, as: :last_name, sortable: true
  indexes title

  where sanitize_sql([ 'isdeleted = ?', false ])

end
