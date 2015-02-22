ThinkingSphinx::Index.define 'salesforce/the_web_fellas/contact', with: :active_record do

  indexes email
  indexes firstname
  indexes lastname, sortable: true
  indexes title

  where sanitize_sql([ 'isdeleted = ?', false ])

end
