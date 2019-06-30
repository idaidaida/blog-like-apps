class NoticeMailer < ApplicationMailer

    def comment_notify_mail
        @blog = params[:blog]
        @entry = params[:entry]
        @comment = params[:comment]

        mail(to: "admin@example.com",subject: "新しくコメントが登録されました")
    end

end
