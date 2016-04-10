module LN.T.User where



import LN.T.Prelude.Argonaut



type UserId = Int



userTag :: String
userTag = "user"



usersTag :: String
usersTag = "users"



countsUsersTag :: String
countsUsersTag = "counts" <> "/" <> usersTag
