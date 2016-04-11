module LN.T.Lens.Field where



import LN.T.Prelude



id_ :: forall b a r. Lens { id :: a | r } { id :: b | r } a b
id_ f o = o { id = _ } <$> f o.id



userId_ :: forall b a r. Lens { userId :: a | r } { userId :: b | r } a b
userId_ f o = o { userId = _ } <$> f o.userId



name_ :: forall b a r. Lens { name :: a | r } { name :: b | r } a b
name_ f o = o { name = _ } <$> f o.name



nick_ :: forall b a r. Lens { nick :: a | r } { nick :: b | r } a b
nick_ f o = o { nick = _ } <$> f o.nick



displayNick_ :: forall b a r. Lens { displayNick :: a | r } { displayNick :: b | r } a b
displayNick_ f o = o { displayNick = _ } <$> f o.displayNick



description_ :: forall b a r. Lens { description :: a | r } { description :: b | r } a b
description_ f o = o { description = _ } <$> f o.description



company_ :: forall b a r. Lens { company :: a | r } { company :: b | r } a b
company_ f o = o { company = _ } <$> f o.company



location_ :: forall b a r. Lens { location :: a | r } { location :: b | r } a b
location_ f o = o { location = _ } <$> f o.location



email_ :: forall b a r. Lens { email :: a | r } { email :: b | r } a b
email_ f o = o { email = _ } <$> f o.email




email_md5_ :: forall b a r. Lens { email_md5 :: a | r } { email_md5 :: b | r } a b
email_md5_ f o = o { email_md5 = _ } <$> f o.email_md5



subject_ :: forall b a r. Lens { subject :: a | r } { subject :: b | r } a b
subject_ f o = o { subject = _ } <$> f o.subject



title_ :: forall b a r. Lens { title :: a | r } { title :: b | r } a b
title_ f o = o { title = _ } <$> f o.title



body_ :: forall b a r. Lens { body :: a | r } { body :: b | r } a b
body_ f o = o { body = _ } <$> f o.body



createdBy_ :: forall b a r. Lens { createdBy :: a | r } { createdBy :: b | r } a b
createdBy_ f o = o { createdBy = _ } <$> f o.createdBy



createdAt_ :: forall b a r. Lens { createdAt :: a | r } { createdAt :: b | r } a b
createdAt_ f o = o { createdAt = _ } <$> f o.createdAt



createdAtMoment_ :: forall b a r. Lens { createdAtMoment :: a | r } { createdAtMoment :: b | r } a b
createdAtMoment_ f o = o { createdAtMoment = _ } <$> f o.createdAtMoment



modifiedBy_ :: forall b a r. Lens { modifiedBy :: a | r } { modifiedBy :: b | r } a b
modifiedBy_ f o = o { modifiedBy = _ } <$> f o.modifiedBy



modifiedAt_ :: forall b a r. Lens { modifiedAt :: a | r } { modifiedAt :: b | r } a b
modifiedAt_ f o = o { modifiedAt = _ } <$> f o.modifiedAt



board_ :: forall b a r. Lens { board :: a | r } { board :: b | r } a b
board_ f o = o { board = _ } <$> f o.board



boardStat_ :: forall b a r. Lens { boardStat :: a | r } { boardStat :: b | r } a b
boardStat_ f o = o { boardStat = _ } <$> f o.boardStat



threadStat_ :: forall b a r. Lens { threadStat :: a | r } { threadStat :: b | r } a b
threadStat_ f o = o { threadStat = _ } <$> f o.threadStat



threadPostStat_ :: forall b a r. Lens { threadPostStat :: a | r } { threadPostStat :: b | r } a b
threadPostStat_ f o = o { threadPostStat = _ } <$> f o.threadPostStat



latestThread_ :: forall b a r. Lens { latestThread :: a | r } { latestThread :: b | r } a b
latestThread_ f o = o { latestThread = _ } <$> f o.latestThread



latestThreadPost_ :: forall b a r. Lens { latestThreadPost :: a | r } { latestThreadPost :: b | r } a b
latestThreadPost_ f o = o { latestThreadPost = _ } <$> f o.latestThreadPost



latestThreadPostUser_ :: forall b a r. Lens { latestThreadPostUser :: a | r } { latestThreadPostUser :: b | r } a b
latestThreadPostUser_ f o = o { latestThreadPostUser = _ } <$> f o.latestThreadPostUser



thread_ :: forall b a r. Lens { thread :: a | r } { thread :: b | r } a b
thread_ f o = o { thread = _ } <$> f o.thread



threadUser_ :: forall b a r. Lens { threadUser :: a | r } { threadUser :: b | r } a b
threadUser_ f o = o { threadUser = _ } <$> f o.threadUser



threads_ :: forall b a r. Lens { threads :: a | r } { threads :: b | r } a b
threads_ f o = o { threads = _ } <$> f o.threads



threadPosts_ :: forall b a r. Lens { threadPosts :: a | r } { threadPosts :: b | r } a b
threadPosts_ f o = o { threadPosts = _ } <$> f o.threadPosts



views_ :: forall b a r. Lens { views :: a | r } { views :: b | r } a b
views_ f o = o { views = _ } <$> f o.views



{-
id_ :: forall b a r. Lens { id :: a | r } { id :: b | r } a b
id_ f o = o { id = _ } <$> f o.id
-}


user_ :: forall b a r. Lens { user :: a | r } { user :: b | r } a b
user_ f o = o { user = _ } <$> f o.user



userPack_ :: forall b a r. Lens { userPack :: a | r } { userPack :: b | r } a b
userPack_ f o = o { userPack = _ } <$> f o.userPack



userStat_ :: forall b a r. Lens { userStat :: a | r } { userStat :: b | r } a b
userStat_ f o = o { userStat = _ } <$> f o.userStat



userProfile_ :: forall b a r. Lens { userProfile :: a | r } { userProfile :: b | r } a b
userProfile_ f o = o { userProfile = _ } <$> f o.userProfile
