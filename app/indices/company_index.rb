ThinkingSphinx::Index.define :company,
  with: :active_record,
  delta: ThinkingSphinx::Deltas::DatetimeDelta,
  delta_options: { threshold: 15.minutes } do

  indexes name, sortable: true

end
