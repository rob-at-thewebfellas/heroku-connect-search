ThinkingSphinx::Index.define 'salesforce/organisation_b/contact',
  with: :active_record,
  delta: ThinkingSphinx::Deltas::DatetimeDelta,
  delta_options: { column: :systemmodstamp, threshold: 15.minutes } do

  indexes department
  indexes email
  indexes firstname, as: :first_name
  indexes lastname, as: :last_name
  indexes title

  indexes [ lastname, firstname ], as: :name, sortable: true

  where sanitize_sql([ 'isdeleted = ?', false ])

end
