module ContactsHelper

  def contact_full_name(contact, include_salutation = true)
    components = [ contact.first_name, contact.last_name ]
    components.unshift(contact.salutation) if include_salutation
    components.delete_if(&:blank?).join(' ')
  end

end
