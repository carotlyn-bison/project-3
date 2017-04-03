module DeviseHelper
  #added a devise helper to costumize the error messages that is the signup page to suck.
  #this can be overwriten but i dont have much time so lets keep it the way it is found this
  #on https://github.com/plataformatec/devise/blob/master/app/helpers/devise_helper.rb

  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <p>#{sentence}</p>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
