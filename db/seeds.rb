Blog.create(title:"ねこがすき！にゃんにゃんブログ")
Blog.create(title:"いぬがすき！わんわんブログ")
Blog.create(title:"つまがすき！いとうさんブログ")

Entry.create(title:"はじめてのエントリー",body:"はじめまして！",blog_id:1)
Entry.create(title:"2番目のエントリー",body:"おひさしぶりです！",blog_id:1)
Entry.create(title:"3番目のエントリー",body:"もうくじけました・・・",blog_id:3)

Comment.create(body:"いい話ですね",status:"approved",entry_id:1)
Comment.create(body:"いい話でした",status:"approved",entry_id:1)
Comment.create(body:"あれれ",status:"unapproved",entry_id:1)