class HttpUrlValidator < ActiveModel::EachValidator

  def self.compliant?(value)
    uri = URI.parse(URI.encode(value))
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end

  def validate_each(record, attribute, value)
    unless value.present? && self.class.compliant?(value)
      record.errors.add(attribute, "Das ist keine gültige URL")
    end
  end
end
