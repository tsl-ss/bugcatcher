class CommentsMailer < ApplicationMailer

  def comment_to_project_author(user)
    @user = report.author_id
    @url  = 'http://example.com/login'
    mail(to: project.user_id, subject: 'Author of project you have a comment')
  end

   def comment_from_project_author(user)
    @user = project.user_id
    @url  = 'http://example.com/login'
    mail(to: report.author_id, subject: 'the author has emailed you back')
  end

end


author needs to be notified when a commenter comments on the auth

commenter needs to be notified when author sends a reponse to the original commenters comment
