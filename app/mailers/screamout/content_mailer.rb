module Screamout
  class ContentMailer < ActionMailer::Base
    default :from => 'intranet@joshsoftware.com'

    def new_content_added(content_id)
      @content = Screamout::Content.where(id: content_id).first
      @title = @content.title.blank? ? @content.url : @content.title
      @tags = @content.tags
      attachments.inline['screamout.jpg'] = File.read(@content.photo.path(:small))
      mail(to: "all@joshsoftware.com", bcc: PR_EMAIL, subject: "#{@content.user.public_profile.name.titleize} shared new content on intranet")
    end
  end
end
