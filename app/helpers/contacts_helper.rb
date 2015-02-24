module ContactsHelper

  def contact_name(contact, include_salutation = true)
    components = [ contact.first_name, contact.last_name ]
    components.unshift(contact.salutation) if contact.respond_to?(:salutation) && include_salutation
    components.delete_if(&:blank?).join(' ')
  end

end
