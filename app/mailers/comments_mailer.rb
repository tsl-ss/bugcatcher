class CommentsMailer < ApplicationMailer

  def comment_to_project_owner(comment)
    @commentor = comment.user
    @project_owner = comment.report.release.project.owner
    @comment = comment
    @release = comment.report.release
    @report = comment.report
    mail(to: @project_owner.email, subject: "[#{comment.report.release.project.name}] New report comment.")
  end

   def comment_from_project_owner(comment)
    @project_owner = comment.user
    @user = comment.report.author
    @comment = comment
    @release = comment.report.release
    @report = comment.report
    mail(to: @user.email, subject: "[#{comment.report.release.project.name}] Response from project owner.")
  end
end
